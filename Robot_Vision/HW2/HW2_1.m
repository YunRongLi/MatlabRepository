% HW2_1

clear;clc;

% Boundary Condition
   t0 = 0;
   x0 = 0;
xdot0 = 0;

   t1 = 1;
   x1 = 3;
xdot1 = 0;

% Determin Cubi Polynomial Matrix Coefficient Vector
[a,b,c,d] = CubiPolynomialVector(t0,t1,x0,xdot0,x1,xdot1);

    position = @(t)a*t.^3 + b*t.^2 + c*t + d;
    velocity = @(t)     3*a*t.^2 + 2*b*t + c;
acceleration = @(t)              3*a*t + 2*b;

t_interval = linspace(0,1.0);

subplot(3,1,1);
plot(t_interval,position(t_interval));
xlabel('Time(s)')
ylabel('x(t)')
axis([-inf,inf,0,3.5]);

subplot(3,1,2);
plot(t_interval,velocity(t_interval));
xlabel('Time(s)')
ylabel('v(t)')
axis([-inf,inf,0,7]);

subplot(3,1,3);
plot(t_interval,acceleration(t_interval));
xlabel('Time(s)')
ylabel('a(t)')

