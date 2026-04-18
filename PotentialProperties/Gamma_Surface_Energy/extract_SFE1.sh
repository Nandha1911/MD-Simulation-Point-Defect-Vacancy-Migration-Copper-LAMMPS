### This is to extract the SFE at various displacements from log.lammps file. This to be used when old file (extract_SFE.sh) generates empty SFE_displace.

grep -i 'displacement and Stacking-fault energy' log.lammps > SFE_displace
sed -i '/^print\b/d' SFE_displace #> SFE_displace1
sed -i -e 's/displacement and Stacking-fault energy =//g' SFE_displace 
sed '1 i\ 0.0 0.0 0.0' SFE_displace >SFE_displace1
mv SFE_displace1 SFE_displace

