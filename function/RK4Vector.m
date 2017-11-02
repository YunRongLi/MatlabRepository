function [k1, k2, k3, k4] = RK4Vector(f,x0,f0,interval)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    k1 = f(x0,f0);
    k2 = f(x0 + interval/2, f0 + interval/2 * k1);
    k3 = f(x0 + interval/2, f0 + interval/2 * k2);
    k4 = f(x0 + interval, f0 + interval * k3);
end

