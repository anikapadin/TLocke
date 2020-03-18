# -*- coding: utf-8 -*-
"""
Starting point for Problem 6a
"""
    
def freefall(h = 10, v = 0 ,g = 9.81):
    import math
    tf = (v/g)  + (math.sqrt(v**2 + 2*g*h)/g)
    vf = v - (g*tf)
    return vf,tf
    
    
def convertlen(l = 1, unit = 'm'):
    if unit == 'm':
        return l*3.28084
    elif unit == 'f':
        return l*0.3048
    else:
        print("Enter either f for feet or m for meters")
        return l
    
def convertang(a = 0, unit = 'd'):
    import math
    if unit == 'd':
        return a*math.pi/180
    elif unit == 'r':
        return a*180/math.pi
    else:
        print("Enter either r for radians or d for degrees")
        return a
def convertspeed(s = 1, inunit = 'fps', outunit = 'mps'):
    if inunit == 'fps':
        fps = s
        mph = s*0.681818
        mps = s*0.3048
    elif inunit == 'mph':
        mph = s
        fps = s*1.46667
        mps = s*0.44704101612192
    elif inunit == 'mps':
        mps = s
        fps = s*3.28084
        mph = s*2.236935695530601
    else:
        print("Invalid input units")
        return s
    if outunit == 'mph':
        return mph
    elif outunit == 'mps':
        return mps
    elif outunit == 'fps':
        return fps
    else:
        print("Invalid output units")
        return s
    
def projectile(v = 10, ang = convertang(45), h = 0,  g = 9.81):
    import math
    import numpy as np
    [vf, tf] = freefall(h, v*math.sin(ang), g)
    r = (v*math.cos(ang))*tf
    hmax = h + v*math.sin(ang)*((v*math.sin(ang))/g) - .5*g*((v*math.sin(ang))/g)**2
    t = np.arange(0, tf, .1)
    x = v*np.cos(ang)*t
    y = v*np.sin(ang)*t - 0.5*g*t**2
    trajectory(x, y)
    return r,tf,hmax    

def trajectory(x = 0, y = 0):
    import matplotlib.pyplot as mp
    mp.plot(x,y,'r-')
    