###Structure Generation for FCC crystal###
#####Author : Nandha Gopal Mariappan######
###########Date:13.06.2022################

import numpy as np
import math as m
list=[]
Num=0
a=input("Enter the Lattice constant: ")
a=float(a)
a1=np.array([0.5,0.5,0])*a
a2=np.array([0.5,0,0.5])*a
a3=np.array([0,0.5,0.5])*a

##Rotation matrix getting from Euler angles

psi = input("Enter your psi value: ")
theta = input("Enter your theta  value: ")
phi = input("Enter your phi value: ")

psi = m.radians(int(psi))
theta = m.radians(int(theta))
phi = m.radians(int(phi))

x_axis = np.array([[1,0,0],[0,m.cos(psi),m.sin(psi)],[0,(-m.sin(psi)),m.cos(psi)]])
y_axis = np.array([[m.cos(theta),0,(-m.sin(theta))],[0,1,0],[m.sin(theta),0,m.cos(theta)]])
z_axis = np.array([[m.cos(phi),m.sin(phi),0],[(-m.sin(phi)),m.cos(phi),0],[0,0,1]])

Q = np.matmul(x_axis,y_axis,z_axis)
print (Q)

A1=np.matmul(Q,a1)
A2=np.matmul(Q,a2)
A3=np.matmul(Q,a3)

outputFile = open('FCC.xyz','w')

outputFile.write('       '' '' '' '' \n')
outputFile.write('\n')
val = input("Enter the box size: ")
val=int(val)
q= (val/a)
q1=m.ceil(q)*4.05
q1=m.ceil(q1)
print (q1)

for i in range((-1*q1),q1):
    for j in range((-1*q1),q1):
        for k in range((-1*q1),q1):
              pos=i*A1+j*A2+k*A3
              if (0<=pos[0]<q1 and 0<=pos[1]<q1 and 0<=pos[2]<q1 ):
                       Num=Num+1
                       outputFile.write('Al ' + str(pos[0]) + ' ' + str(pos[1]) + ' ' + str(pos[2])+ '\n' )


outputFile1 = open('FCC.xyz','r+')
outputFile1.readline()
#print (outputFile1.seek(2,0))
#print (Num)
outputFile1.write(str(Num))
outputFile1.close()
