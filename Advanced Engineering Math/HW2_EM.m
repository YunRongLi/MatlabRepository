clear;clc;

t = 0:0.1:0.5;
%
interval = 0.1;
%
y(1,1) = 0;
ydot(1,1) = 0;
yddot(1,1) = 0;

for time_step = 1:1:5
    yddot(1,time_step) = x2dot(y(1,time_step),ydot(1,time_step));
    
    ydot(1,time_step+1) = EM(ydot(1,time_step),yddot(1,time_step),interval);
    
    y(1,time_step+1) = EM(y(1,time_step),ydot(1,time_step),interval);
end

plot(t,y);

%
function [yddot] = x2dot(y,ydot)
    yddot = 20 - 2 * ydot - 20 * y;
end
%



