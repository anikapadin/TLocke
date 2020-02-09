%Define constants
G = 6.67408e-11;
M = 5.972e24;
R = 6.371e6;
%get T here(minutes)
T = strsplit(input("Period followed by unit(s/m/h/d) separated by commas: ", 's'), ',');
T = strtrim(T);
[nums, tf] = str2num(T)
nums = nums(tf)
units = T(~tf)
while numel(nums) ~= numel(units)
    error("Please enter only numeric values")
    T = input("Period in minutes: ", 'x');
    T = strtrim(T)
    [nums, tf] = str2num(T)
    nums = nums(tf)
    units = T(~tf)
end
%Convert T to seconds
switch t
    case 's'
    case 'm'
        T =  T * 60;
    case 'h'
        T = T * 3600
    case 'd'
        T = T * 3600 * 24
    otherwise
        error("Invalid Units")
end

%Calculate height and velocity
h = ((G*M*T.^2)/(4*pi^2)).^(1/3) - R;
v = (2 * pi * (R + h))/T;
%convert h to kilometers and print
if h < 0
    error("Orbit is impossible")
else
    h = h/1000;
    disp(round(h, 3, "significant") + " km, " + round(v, 3, "significant") + " m/s")
end

%answer questions here
%Q1: 45 min: "-2180 km" impossible. 90 min: 281 km.  1 day: 35800 km
%Q2: Satellites take less time to orbit the earth because as the earth is
%rotating, it is also revloving around the sun.  A satellite orbiting once
%every 24 hours will have an altitude that is 100 km higher(35900 km)