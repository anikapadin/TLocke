function [range, flighttime] = projectile(velocity, launchangle)
%PROJECTILE 
%   Detailed explanation goes here
g = 9.81
flighttime = 2.*velocity.*sin(deg2rad(launchangle))./g
range = velocity.*cos(deg2rad(launchangle)).*flighttime
end

