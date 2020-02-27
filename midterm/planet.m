function [pT,pg] = planet(m,r,sm,a)
%PLANET takes planet mass(in earth masses), planet radius(in Earth Radii), 
%star mass(in sun masses), and orbital radius(in AU) and
%returns the planet's oirbital period(in earth years), and the
%accceleration due to gravity(in multiples of g = 9.81
pT = a.^3;
pg = (m)./(r.^2);

end

