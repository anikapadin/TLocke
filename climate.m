filename1 = 'C:\Users\tyler\Desktop\School\PHYS1211\GitHub\CompProbSol\data\GlobalCarbonBudget2018.xlsx';
filename2 = 'C:\Users\tyler\Desktop\School\PHYS1211\GitHub\CompProbSol\data\GlobalTempbyYear.txt';
%import globalcarbonbudget historical table into table
data1 = readtable(filename1, 'Sheet', 'Historical Budget', 'Range', 'A15:G283')
%import first 2 columns from
fid = fopen(filename2);
data2 = textscan(fid, '%f %f %*[^\n]','HeaderLines',0);
fid = fclose(fid);
fossilsum = cumsum(data1.fossilFuelAndIndustry(data1.Year > 1849))
landusesum = cumsum(data1.land_useChangeEmissions(data1.Year > 1849))