# -*- coding: utf-8 -*-
"""
Created on Tue Jan  8 17:28:03 2019

@author: Tom K
"""
# import all of numpy library
import numpy as np
# import all of matplotlib.pyplot module
import matplotlib.pyplot as pyp 


T = input("Input the bodys orbital period around the Earth (in hr or min): ")
T, un = T.split(" ")
T = float(T)
    
if un=="hr" or un=="hour":
    t = 3600*T;
elif un == "min" or un == "m":
    t = 60*T;
else:
    print("bad input")
    
G = 6.67*10**(-11);
M = 5.98*10**(24);
R = 6.371*10**(6);


h = (G*M*t**2/(4*np.pi**2))**(1/3) - R;
v = np.sqrt(G*M/(h+R))
vkm=v/1000
hkm=h/1000
print('Orbits at a altitude of {0:.1f} km and at a speed of {1:.1f} km/s.'.format(hkm,vkm))
T = np.arange(1.5,60)
t = 3600*T
h = (G*M*t**2/(4*np.pi**2))**(1/3) - R;
v = np.sqrt(G*M/(h+R))
hkm = h/1000
vkm = v/1000
pyp.figure()
pyp.plot(T,hkm)
pyp.xlabel('Period(Hours)')
pyp.ylabel('Height(Kilometers)')
pyp.figure()
pyp.plot(T,vkm)
pyp.xlabel('Period(Hours)')
pyp.ylabel('Velocity(Kilometers/Second)')