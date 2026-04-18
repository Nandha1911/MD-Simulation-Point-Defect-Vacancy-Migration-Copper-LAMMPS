# NOTE: This script can be modified for different pair styles 
# See in.elastic for more info.

#Provide potential
pair_style      eam/alloy  ### TYPE OF POTENTIAL (eam (OR) eam/alloy)
pair_coeff      *  *  /home03/nm95xule/TMS_SS2022Nan/Mishin_updated-Al-Co-2013.eam.alloy Al  ### POTENTIAL FILENAME

# Setup neighbor style
neighbor 1.0 nsq
neigh_modify once no every 1 delay 0 check yes

# Setup minimization style
min_style	     cg
min_modify	     dmax ${dmax} line quadratic

# Setup output
thermo		10
thermo_style custom step temp pe press pxx pyy pzz pxy pxz pyz lx ly lz vol fnorm
thermo_modify norm no
