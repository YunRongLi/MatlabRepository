clear;clc;

[t,x] = ode45('ex', [0:0.1:10.0], [0 0]);


plot(t,x(:,1));