%Define constants
G = 6.67408e-11;
M = 5.972e24;
R = 6.371e6;
%get T here(minutes)
T = input("Period = ")

%Convert T to seconds
T =  T * 60;

%Calculate height
h = ((G*M*T^2)/(4*pi^2))^(1/3) - R;

%convert h to kilometers and print
h = h/1000;
disp(h + " km")


