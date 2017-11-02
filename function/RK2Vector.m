function [k1,k2] = RK2Vector(f,x0,f0,interval)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    k1 = interval * f(x0,f0);
    k2 = interval * f(x0 + interval , f0 + k1);
end

