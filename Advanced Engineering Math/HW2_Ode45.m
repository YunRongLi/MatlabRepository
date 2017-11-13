clear;clc;

[t,x] = ode45(, [0:0.1:10.0], [0 0]);


plot(t,x(:,1));

function xdot = xdot(t,x)
    
    xdot(1) = x(2);
    xdot(2) = 20 - 2 * x(2) - 20 * x(1);
    xdot = [xdot(1);xdot(2)];
end