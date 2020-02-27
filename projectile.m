function [range, flighttime] = projectile(velocity, launchangle, unit)
%PROJECTILE 
%   takes initital velocity, launch angle(in degrees), and unit of velocity(either 'ms' or 'mph'as arguments,
%   returns projectile's range and flight time in meters and seconds. 
%
if nargin < 3
    unit = 'ms'
end
if nargin < 2
    launchangle = 45
end
if unit == 'mph'
    velocity = velocity .* 0.44704
end
g = 9.81
flighttime = 2.*velocity.*sin(deg2rad(launchangle))./g
range = velocity.*cos(deg2rad(launchangle)).*flighttime
end

