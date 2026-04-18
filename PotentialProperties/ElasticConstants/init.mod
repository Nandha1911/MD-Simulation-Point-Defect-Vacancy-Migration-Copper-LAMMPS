# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-6
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-5

# Uncomment one of these blocks, depending on what units
# you are using in LAMMPS and for output

# metal units, elastic constants in eV/A^3
#units		metal
#variable cfac equal 6.2414e-7
#variable cunits string eV/A^3

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# real units, elastic constants in GPa
#units		real
#variable cfac equal 1.01325e-4
#variable cunits string GPa

# Define minimization parameters
variable etol equal 0.0 
variable ftol equal 1.0e-10
variable maxiter equal 10000
variable maxeval equal 50000
variable dmax equal 1.0e-2

variable 	latt0 equal 4.05000018187522  #### provide the lattice constant from your calculation
#variable 	lblock	equal 10

# generate the box and atom positions using a diamond lattice
variable a equal 3.52

boundary	p p p

#lattice         diamond $a
#region		box prism 0 2.0 0 3.0 0 4.0 0.0 0.0 0.0
#create_box	1 box
#create_atoms	1 box
lattice		fcc  ${latt0}  orient  x  1  0  0  orient  y  0  1  0  orient  z  0  0  1  origin  0.0    0.0    0.0
region		box prism 0 2.0 0 3.0 0 4.0 0.0 0.0 0.0
create_box	1 box
create_atoms	1 box
#region          sim_region  block  0  ${lblock}  0  ${lblock}  0  ${lblock}  units  lattice
#create_box      1  sim_region
#create_atoms	1  box

# Need to set mass to something, just to satisfy LAMMPS
mass 1 1.0e-20

