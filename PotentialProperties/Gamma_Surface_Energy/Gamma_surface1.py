import matplotlib.pyplot as plt
import numpy as np
from matplotlib import cm  # colormap

#######################################################################################################################################################################################################

# main program

file = np.loadtxt("SFE_displace")  # loading outputfile from LAMMPS which was extracted using awk

x = file[1:,0].reshape((30,30))  # x - coordinates i.e., displacement in the direction [1 1 2]
y = file[1:,1].reshape((30,30))  # corresponding y - coordinates i.e., displacement in the direction [-1 1 0]
z = file[1:,2].reshape((30,30))  # corresponding Stacking fault energies at the x and y - displacements


cs = plt.contourf(x,y,z,cmap=cm.viridis) #  viridis - color blind friendly colormap
plt.axis([0,-3.05,0,-5.3])
plt.colorbar(cs, shrink=0.5, aspect=5, label="Stacking Fault Energy in mJ/m^2")  # legend for the contour
plt.title("Gamma Surface - 2D Plot")
plt.xlabel("Displacement in [1 1 2] direction")
plt.ylabel("Displacement in [-1 1 0] direction")
plt.show()
