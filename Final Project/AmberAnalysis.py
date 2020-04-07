# -*- coding: utf-8 -*-
"""
Created on Sat Apr  4 18:07:06 2020

@author: tyler
"""

import pandas as pd

#converts amber's output files to 
def amberin(filename, dataname = 'Data'):
    raw = pd.read_table(filename, header = None)
    separate = lambda x: [x[0:12].strip(), x[12:].strip()]
    raw[0] = raw[0].apply(separate)
    time = [myfloat(x[0]) for x in raw[0]]
    data = [myfloat(x[1]) for x in raw[0]]
    dfin = {'Time': time, dataname: data}
    df = pd.DataFrame(dfin, columns = ['Time', dataname])
    return df

#This extends python's string to float function, returning NaN for empty strings
def myfloat(s):
    if not s:
        return float("NaN")
    else:
        return float(s)
    

names = ["DENSITY", "EKTOT", "EPTOT", "TEMP", "VOLUME"]
analysis = pd.DataFrame()
for n in names:
    d = amberin(n + ".txt", n)
    analysis["Time"] = d["Time"]
    analysis[n] = d[n]

analysis["MASS"] = analysis["VOLUME"]*analysis["DENSITY"]
analysis["ETOT"] = analysis["EKTOT"] + analysis["EPTOT"]

import matplotlib.pyplot as mp
mp.plot(analysis["Time"], analysis["TEMP"])
mp.xlabel("Simulation Time(ps)")
mp.ylabel("Temperature(Kelvin)")
mp.show()
mp.plot(analysis["Time"], analysis["DENSITY"])
mp.xlabel("Simulation Time(ps)")
mp.ylabel("Density")
mp.show()

mp.plot(analysis["Time"], analysis["EKTOT"])
mp.plot(analysis["Time"], analysis["EPTOT"])
mp.plot(analysis["Time"], analysis["ETOT"])
mp.xlabel("Simulation Time(ps)")
mp.ylabel("Energy(kcakl/mol)")
mp.legend(["Kinetic Energy", "Potential Energy", "Total"])
mp.show()

mp.plot(analysis["Time"], analysis["VOLUME"])
mp.xlabel("Simulation Time(ps)")
mp.ylabel("Volume")
mp.show()





import numpy as np