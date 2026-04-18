### This is to extract the SFE at various displacements from log.lammps file. This to be used when old file (extract_SFE.sh) generates empty SFE_displace.

grep -i 'displacement and TFE' log.lammps > TFE_displace
sed -i '/^print\b/d' TFE_displace #> TFE_displace1
sed -i -e 's/displacement and TFE =//g' TFE_displace 
#sed '1 i\ 0.0 0.0 0.0' TFE_displace >TFE_displace1
#mv TFE_displace1 TFE_displace

