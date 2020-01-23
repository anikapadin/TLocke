%question 1
numdense = sum(density > .997)
densenames = names(density > .997)

%question 2
numisotopes = sum(isotopes > 100)
isotopenames = names(isotopes > 100)

%question 3
numold = sum(discyear < 1900)
oldnames = names(discyear < 1900)

%question 4
plot(atomicweight, density, ".-r")
title('Density vs. Atomic Weight')
xlabel('Atomic Weight(u)')
ylabel('Density(g/cm^3)')