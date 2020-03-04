function [range, flighttime] = projectile(velocity, launchangle, height, unit)
%PROJECTILE 
%   takes initital velocity, launch angle(in degrees), and unit of velocity(either 'ms' or 'mph'as arguments,
%   returns projectile's range and flight time in meters and seconds. 
%\
if nargin < 1
    velocity = 10
end
if nargin < 2
    launchangle = 45
end
if nargin < 3
    height = 0
end
if nargin < 4
    unit = "ms"
end
if velocity < 0
    error("Please enter only positive velocities")
end
if unit != "mph" && unit != "ms"
    error("units must be either 'mph' or 'ms'")
end
if launchangle < 0 || launchangle > 90
    error("launch angle must be between 0 and 90")
end
if unit == "mph"
    velocity = velocity .* 0.44704
end
g = 9.81

flighttime = velocity.*sin(deg2rad(launchangle))./g  + sqrt((velocity.*sin(deg2rad(launchangle))).^2 + 2*g*height)./g
range = velocity.*cos(deg2rad(launchangle)).*flighttime
maxh = ((velocity.*sin(deg2rad(launchangle))).^2)./(2*g) + height

times = 0:0.1:flighttime
xco = times.*velocity.*cos(deg2rad(launchangle))
yco = (-g/2).*(times.^2) + (velocity*sin(deg2rad(launchangle))).*times + height

h = animatedline;
axis([0,range,0,maxh])

for k = 1:length(xco)
    addpoints(h,xco(k),yco(k));
    drawnow
end

