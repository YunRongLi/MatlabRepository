function [x] = EM(f,t0,x0,y0,interval)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x = x0 + interval * f(x0,y0,t0);
end

