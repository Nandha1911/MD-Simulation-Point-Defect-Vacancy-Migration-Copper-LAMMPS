# Molecular Dynamics Simulation of Point Defect Formation and Vacancy Migration in Copper (Cu)

> LAMMPS-based atomistic simulations of vacancy defect energetics and migration in FCC copper using the Embedded Atom Method (EAM) potential.

---

## Overview

This repository contains LAMMPS input scripts, OVITO visualization pipelines, and output dump files for a molecular dynamics study of **point defect formation and vacancy migration in FCC copper**. The simulations compute key defect properties — vacancy formation energy, migration barriers, and diffusion behaviour — using the well-established EAM interatomic potential for copper.

This work was completed as part of academic coursework in computational materials science / atomistic simulation methods.

---

## Repository Structure

```
.
├── input/
│   ├── in.equilibration          # NVT/NPT equilibration of perfect Cu supercell
│   ├── in.vacancy_formation      # Single vacancy creation and energy minimization
│   └── in.vacancy_migration      # NEB or MD-based vacancy hop study
│
├── potentials/
│   └── Cu_mishin1.eam.alloy      # EAM potential file (Mishin et al., 2001)
│
├── output/
│   ├── dump.*.lammpstrj          # Atomic trajectory dump files (OVITO-readable)
│   ├── log.lammps                # LAMMPS run log with thermo output
│   └── results_summary.txt       # Extracted vacancy formation energy & migration data
│
├── ovito/
│   └── visualize_vacancy.py      # OVITO Python script for defect visualization
│
└── README.md
```

---

## Physical Problem

In FCC metals like copper, **point vacancies** are the dominant intrinsic defects that control:
- Self-diffusion at elevated temperatures
- Creep and radiation damage recovery
- Dislocation climb mechanisms

This simulation study addresses two core questions:

1. **Vacancy formation energy** — How much energy does it cost to remove one Cu atom from a perfect lattice site and place it at the surface?
2. **Vacancy migration** — What is the energy barrier for a neighbouring atom to hop into the vacant site, and how does this drive diffusion?

---

## Simulation Details

| Parameter | Value |
|---|---|
| Material | Copper (Cu), FCC |
| Interatomic potential | EAM — Mishin *et al.*, Phys. Rev. B, 2001 |
| Supercell size | 5×5×5 unit cells (500 atoms) |
| Lattice constant | 3.615 Å |
| Ensemble | NVT (equilibration) → NVE (production) |
| Thermostat | Nosé–Hoover |
| Timestep | 1 fs |
| Simulation temperature | 300 K (and sweep if applicable) |
| Boundary conditions | Periodic in all three directions |
| Vacancy creation | Remove one atom; conjugate gradient energy minimization |

---

## Key Results

| Quantity | Computed Value | Literature Reference |
|---|---|---|
| Vacancy formation energy, *E*_f | ~ 1.27 eV | ~1.28 eV (Mishin EAM) |
| Vacancy migration barrier, *E*_m | ~ 0.70 eV | ~0.69–0.72 eV |
| Equilibrium lattice constant | 3.615 Å | 3.615 Å (exp.) |

> **Note:** Update the computed values above with your actual simulation results before submission.

---

## How to Run

### Prerequisites

- [LAMMPS](https://www.lammps.org/) (any stable release, e.g. `23Jun2022`)
- Python 3.x with [OVITO](https://www.ovito.org/) (`pip install ovito`) for visualization
- EAM potential file placed in `potentials/`

### Step 1 — Equilibrate the perfect supercell

```bash
lmp -in input/in.equilibration
```

### Step 2 — Create vacancy and compute formation energy

```bash
lmp -in input/in.vacancy_formation
```

The formation energy is computed via:

```
E_f = E(N-1, vacancy) - ((N-1)/N) * E(N, perfect)
```

### Step 3 — Run vacancy migration

```bash
lmp -in input/in.vacancy_migration
```

### Step 4 — Visualize with OVITO

```bash
python ovito/visualize_vacancy.py
```

This script uses OVITO's Wigner–Seitz defect analysis to identify and highlight vacant sites across trajectory frames.

---

## Visualization

The OVITO Python script (`ovito/visualize_vacancy.py`) performs:

- **Wigner–Seitz cell analysis** to identify vacancy sites frame-by-frame
- **Common Neighbour Analysis (CNA)** to confirm FCC structure integrity
- Color-mapping of defect sites for trajectory rendering
- Export of defect count vs. time data to CSV

Open any `.lammpstrj` dump file directly in the OVITO GUI for interactive inspection.

---

## Interatomic Potential

The **EAM potential by Mishin *et al.* (2001)** is used throughout. This potential accurately reproduces:
- Equilibrium lattice constant and elastic constants of Cu
- Vacancy formation and migration energies
- Stacking fault energies in FCC copper

**Reference:**
> Y. Mishin, M.J. Mehl, D.A. Papaconstantopoulos, A.F. Voter, J.D. Uberuaga,
> *Structural stability and lattice defects in copper: Ab initio, tight-binding, and embedded-atom calculations*,
> Phys. Rev. B **63**, 224106 (2001). DOI: [10.1103/PhysRevB.63.224106](https://doi.org/10.1103/PhysRevB.63.224106)

The potential file (`Cu_mishin1.eam.alloy`) is available from the [NIST Interatomic Potentials Repository](https://www.ctcms.nist.gov/potentials/).

---

## Learning Outcomes

Through this project, the following atomistic simulation concepts were applied hands-on:

- Construction and periodic replication of FCC supercells in LAMMPS
- Energy minimization (conjugate gradient) for defect structures
- Thermodynamic ensembles (NVT, NVE) and Nosé–Hoover thermostat
- Vacancy formation energy calculation from total energy differences
- OVITO Wigner–Seitz analysis for point defect identification
- Interpretation of LAMMPS thermo output and dump trajectories

---

## Author

**Nandha Gopal Mariappan**
M.Sc. Computational Materials Science — TU Bergakademie Freiberg
GitHub: [github.com/Nandha1911](https://github.com/Nandha1911)

---

## License

This repository is shared for academic and educational purposes.
Feel free to use or adapt the scripts with attribution.
