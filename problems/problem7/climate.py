# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 20:17:43 2020

@author: tyler
"""
import pandas as pd
def loadclimate():
    return pd.read_csv('climate.txt')

def loadglobaltemp():
    return pd.read_csv('GlobalTempBYMonth.txt', sep="   ",header=None, usecols = [0, 1], names=['date', 'avgtemp'], engine = 'python')

def highestyears(df, col, num = 10, year = 'Year'):
    sort = df.sort_values(by=[col], ascending=False)
    return list(sort[year][0:num])

def intersection(l1, l2):
    return [x for x in l1 if x in l2]

def extractyears(dates):
    return [int(date[0:4]) for date in dates]

def writetoexcel(dataframes, names):
    writer = pd.ExcelWriter('climate.xlsx', engine='xlsxwriter')
    ind = 0
    for df in dataframes:
        df.to_excel(writer, sheet_name = names[ind])
        ind+=1
    writer.save()

def createrecords(df, year = "Year", temp = 'avgtemp'):
    return df.sort_values(by=[temp], ascending = False)[year]