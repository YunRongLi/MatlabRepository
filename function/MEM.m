function [x] = MEM(f,t0,x0,y0,interval)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    px = EM(f,t0,x0,y0,interval);
    
    x = x0 + interval/2 * (f(x0,y0,t0) + px) ;
end

