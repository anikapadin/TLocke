csvperiodic = 'smallperiodictable.csv'
datatable = readtable(csvperiodic)
datastruct = table2struct(datatable)

%question 1
densenames = sort(datatable.Element(datatable.Density > datatable.Density(80) & datatable.Isotopes < 30))
densenum = numel(densenames)
%Question 2
symbols = datatable.Symbol(datatable.DiscoveryYear>=1900 & datatable.DiscoveryYear<2000)
avgweight = mean(datatable.AtomicWeight(datatable.DiscoveryYear>=1900 & datatable.DiscoveryYear<2000))

%question 3 
sorted = sortrows(datatable, 6, 'descend')
topten = sorted.Element(1:10)

%Question 4: Tables are generally easier to work with than structs, but
%they also require you to have the same number of rows for every variable,
%so it is not useful for cases where you aare working with different sized
%lists