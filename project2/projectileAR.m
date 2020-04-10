function [hmax, range, flight] = projectileAR(v0, theta, h, C, rho, A, m, g)
%PROJECTILEAR 
%   takes initital velocity, launch angle, initial height, drag constant, air density, cross sectiional area, mass, and gravity as arguments,
%   returns projectile's max height, range and flight time. 
%   All units are SI
%\

%defaults(Sorry about the next 50 lines of if statements, it hurt me too)
if nargin < 1
    v0 = 10;
end
if nargin < 2
    theta = 45;
end
if nargin < 3
    h = 0;
end
if nargin < 4
    C = .47;
end
if nargin < 5
    rho = 1.225;
end
if nargin < 6
    A = .0314;
end
if nargin < 7
    m = 1;
end
if nargin < 8
    g = 9.81;
end
%check input
if h < 0
    print("Height must be positive")
end
if v0 < 0
    print("Velocity must be positive")
end
if theta < 0 or theta > 90:
    print("theta must be between 0 and 90 degrees")
end
if C < 0
    print("Drag constant must be positive")
end
if rho < 0
    print("Density must be positive")
end
if A < 0
    print("Area must be positive")
end
if m < 0
    print("Mass must be positive")
end
if g < 0
    print("Gravity must be positive")
end

%initial conditions and args
coeff = C*rho*A/(2*m);
theta = pi*theta/180;
w0 = [0, v0*cos(theta), h, v0*sin(theta)];
tspan = [0 inf];
opts = odeset('events',@events);

%solve
[t,R] = ode45(@proj,tspan,w0,opts, coeff, g);

%take values from R for plot and find return values
flight = t(end);
xco = R(:, 1)';
yco = R(:, 3)';
range = xco(end);
hmax = max(yco);

%animated plot of trajectory
plot = animatedline;
axis([0,range+1,0,hmax + 1]);
for k = 1:length(xco)
    addpoints(plot,xco(k),yco(k));
    drawnow
end


    %returns time derivatives of all elements of r = [x, vx, y, vy]
    function rdot = proj(t, r, coeff, g)
        x = r(1);
        vx = r(2);
        y = r(3);
        vy = r(4);
        dx = vx;
        dvx = -coeff*(vx^2);
        dy = vy;
        %force acts apposing motion
        if dy<0
            coeff = -coeff;
        end
        dvy = -g-coeff*(vy^2);
        rdot = [dx; dvx; dy; dvy];
    end
    %terminates ODE solver when y = 0 while decreasing
    function [value,isterminal,direction] = events(t,r, coeff, g)
        value = r(3);     
        isterminal = 1;   
        direction = -1;
    end
end
