function varargout = ptable(varargin)
%import periodic table, and add column for # nucleons
table = readtable('periodictabledata.csv');
table.NumNucleons = round(table.AtomicWeight);
%no input
if nargin == 0
    [mass, binden, bindenpernuc] = semimass(table.AtomicNumber, table.NumNucleons);
    figure(1)
    plot(table.AtomicNumber, mass)
    ylabel("mass(semi-empirical formula)")
    xlabel("atomic number")
    yyaxis right
    plot(table.AtomicNumber, table.AtomicWeight*931.5)
    ylabel("mass(reference)")
    figure(2)
    plot(table.AtomicNumber, bindenpernuc)
    ylabel("Binding energy per nucleon")
    xlabel("atomic number")
    varargout = varargin
%one input
elseif nargin == 1
    atnum = varargin{1};
    [mass , be, bepn] = semimass(atnum, table.NumNucleons(atnum));
    varargout{1} = mass;
    varargout{2} = table(atnum, :);
elseif nargin == 2
    %Cases with 1 char input
    if strcmp(class(varargin{1}), 'char')
       varargout{1} = semimass(varargin{2}, table.NumNucleons(varargin{2}))
       varargout{2} = table(varargin{2}, varargin{1})
    elseif strcmp(class(varargin{2}), 'char')
        varargout{1} = semimass(varargin{1}, table.NumNucleons(varargin{1}))
       varargout{2} = table(varargin{1}, varargin{2})
    %2 num input
    else
        varargout{1} = semimass(varargin{1}, varargin{2});
        varargout{2} = is_stable(table.Symbol(varargin{1}), varargin{2})
    end
else
    varargout = varargin
end

end
%gives mass, binding energy, and binding energy per nucleon
%inputs are atomic number and total number of nucleons
function [m, eb, bepn] = semimass(Z, A)
%constants
mp = 938.28;
mn = 939.5;
av = 15.8;
as = 18.3;
ac = 0.714;
aa = 23.2;
ap = 12;

%binding energy without delta term
eb = (av*A) - (as*(A.^(2/3))) - (ac*Z.*(Z-1)./(A.^(1/3))) - (aa*((A-2*Z).^2)./A);

%add delta term if needed
if mod(A, 2) == 0
    if mod(Z, 2) == 0
        eb = eb + ap/sqrt(A);
    else
        eb = eb - ap/sqrt(A);
    end
end

%calculate mass and binding energy per nucleon
m = Z*mp + (A-Z)*mn - eb;
bepn = eb./A;
end 
%Couldn't find any definite methods for determining stability, so I ripped
%this list of all stable isotopes from wolfram alpha, saved it in 
%stableisotopes.txt, and compared the input to that
function is = is_stable(symbol, A)
stable = importdata('stableisotopes.txt');
isotopes = split(stable, ' | ');
isosym = symbol + "-" + A;
is = any(strcmp(isotopes, isosym));
end