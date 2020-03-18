%Define constants
G = 6.67408e-11;
M = 5.972e24;
R = 6.371e6;
%get times and units here
T = strsplit(input("Period followed by unit(s/m/h/d) separated by commas: ", 's'), {',', ' '});
T = strtrim(T);
%I used for loops here to handle the possibility of multiple inputs

%get numeric values
for ind = 1:numel(T)/2
    [txt, true] = str2num(T{ind*2 - 1});
    if true
        nums(ind) = txt;
    else
        error('please only enter numeric values and units')
    end
end
%get units
for ind = 1:numel(T)/2
    units(ind) = T{ind*2};
end

for ind = 1:numel(units)
    time = nums(ind);
    %convert time to seconds
    switch units(ind)
        case 's'
        case 'm'
            time =  time * 60;
        case 'h'
            time = time * 3600;
        case 'd'
            time = time * 3600 * 24;
        otherwise
            error("Invalid Units")
    end
    %Calculate height and velocity
    h = ((G*M*time.^2)/(4*pi^2)).^(1/3) - R;
    v = (2 * pi * (R + h))/time;
    %convert h to kilometers and print
    if h < 0
        error("Orbit is impossible")
    else
        h = h/1000;
        disp(round(h, 3, "significant") + " km, " + round(v, 3, "significant") + " m/s")
    end
end

%answer questions here
%Q1: 45 min: "-2180 km" impossible. 90 min: 281 km.  1 day: 35800 km
%Q2: Satellites take less time to orbit the earth because as the earth is
%rotating, it is also revloving around the sun.  A satellite orbiting once
%every 24 hours will have an altitude that is 100 km higher(35900 km)