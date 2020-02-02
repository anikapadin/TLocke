filename1 = 'GlobalCarbonBudget2018.xlsx';
filename2 = 'GlobalTempbyYear.txt';
%import globalcarbonbudget historical table into table
data1 = readtable(filename1, 'Sheet', 'Historical Budget', 'Range', 'A15:G283');
%import first and last 2 columns from
fid = fopen(filename2);
%data2 = textscan(fid, '%f %f %*[^\n]', 168, 'HeaderLines',0);
data2 = textscan(fid, '%f %f %*f %*f %*f %*f %*f %*f %*f %*f %f %f', 168, 'HeaderLines',0);
fid = fclose(fid);
%cumulative sums
fossilsum = cumsum(data1.fossilFuelAndIndustry(data1.Year > 1849));
landusesum = cumsum(data1.land_useChangeEmissions(data1.Year > 1849));
%make table, remove years without data, add additional data parameters
t = table(data1.Year, data1.fossilFuelAndIndustry, data1.land_useChangeEmissions, 'VariableNames', {'Year' 'fossilFuelAndIndustry' 'land_useChangeEmissions'});
t = rmmissing(t);
t.sum = fossilsum + landusesum;
t.avgtemp = data2{2};
t.lowerbound = data2{3};
t.upperbound = data2{4};

%make graphs
figure(1)
yyaxis left;
plot(t.Year, t.avgtemp);
xlabel('year');
ylabel('Average Global Temperature')

yyaxis right;
plot(t.Year, t.sum);
ylabel('Cumulative Carbon Sum');

figure(2)
yyaxis left;
errorbar(t.Year, t.avgtemp, t.avgtemp - t.lowerbound, t.upperbound - t.avgtemp);
xlabel('year');
ylabel('Average Global Temperature');

yyaxis right;
plot(t.Year, t.sum);
ylabel('Cumulative Carbon Sum');

figure(3)
scatter(t.sum, t.avgtemp);
xlabel('Cumulative Carbon Sum');
ylabel('Average Global Temperature')

%Save and write
save('climate', 't')
writetable(t, 'climate')
