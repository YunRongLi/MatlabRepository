function xdot = ex(t,x)
    
    xdot(1) = x(2);
    xdot(2) = 20 - 2 * x(2) - 20 * x(1);
    xdot = [xdot(1);xdot(2)];
end

