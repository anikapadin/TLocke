# -*- coding: utf-8 -*-
"""
Created on Fri Apr 10 12:40:33 2020

@author: tyler
"""
import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as mp

#defaults to 1 kg sphere, radius 10 cm at sea level on earth
#like a smaller, denser basketball I guess
def projectile(v0, theta = 45, h = 0, C = .47, rho = 1.225, A = np.pi*.01, m = 1, g = 9.81):
    #check everything
    if h < 0:
        print("Height must be positive")
        return 0
    if v0 < 0:
        print("Velocity must be positive")
        return 0
    if theta < 0 or theta > 90:
        print("theta must be between 0 and 90 degrees")
        return 0
    if C < 0:
        print("Drag constant must be positive")
        return 0
    if rho < 0:
        print("Density must be positive")
        return 0
    if A < 0:
        print("Area must be positive")
        return 0
    if m < 0:
        print("Mass must be positive")
        return 0
    if g < 0:
        print("Gravity must be positive")
        return 0
    #initial conditions
    theta = np.pi*theta/180
    wo = [0, v0 * np.cos(theta), h, v0*np.sin(theta)]
    #max time of 30 seconds
    t = np.linspace(0,30,1000)
    tstep = 30/1000
    #conditions of motion
    env = (C, rho, A, m, g)
    #solve for [x, vx, y, vy]
    sol = odeint(model, wo, t, env)
    #find max y value
    hmax = max(sol[:, 2])
    #find when projectile hits groud(y = 0)
    i = 1
    while sol[i, 2] > 0:
        i += 1
    flight = i
    xmax = sol[i, 0]
    
    #plot
    mp.plot(sol[0:flight, 0], sol[0:flight, 2])
    mp.xlabel("X position(m)")
    mp.xlabel("Y position(m)")
    mp.show()
    
    return [hmax, xmax, flight*tstep]
    
def model(r, t, C, rho, A, m, g):
    coeff = C*rho*A/(2*m)
    
    #r = [x, vx, y, vy]
    x = r[0]
    vx = r[1]
    y = r[2]
    vy = r[3]
    dx = vx
    dvx = -coeff*(vx**2)
    dy = vy
    #force acts apposing motion
    if dy<0:
        coeff = -coeff
    dvy = -g-coeff*(vy**2)
    return np.array([dx, dvx, dy, dvy])