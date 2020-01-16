%Define constants
G = 6.67408e-11;
M = 5.972e24;
R = 6.371e6;
%get T here(minutes)
T = input("Period in minutes: ");

%Convert T to seconds
T =  T * 60;

%Calculate height and velocity
h = ((G*M*T.^2)/(4*pi^2)).^(1/3) - R;
v = (2 * pi * (R + h))/T;
%convert h to kilometers and print
h = h/1000;
disp(round(h, 3, "significant") + " km, " + round(v, 3, "significant") + " m/s")

%answer questions here
%Q1: 45 min: "-2180 km" impossible. 90 min: 281 km.  1 day: 35800 km
%Q2: Satellites take less time to orbit the earth because as the earth is
%rotating, it is also revloving around the sun.  A satellite orbiting once
%every 24 hours will have an altitude that is 100 km higher(35900 km)