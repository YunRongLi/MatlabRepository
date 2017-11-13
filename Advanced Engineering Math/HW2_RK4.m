clear;clc;

final_time = 10;
interval = 0.1;

t = 0:interval:final_time;

y(1,1) = 0;
ydot(1,1) = 0;

x1dot = @(ydot)ydot;
x2dot = @(y,ydot)20 - 2 * ydot - 20 * y;

Output = RK4(x1dot, x2dot, y(1,1), ydot(1,1), interval, final_time);

figure(7)
plot(t,Output(:,1));

figure(8)
plot(t,Output(:,2));

