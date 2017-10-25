function [a,b,c,d] = CubiPolynomialVector(t0,t1,x0,xdot0,x1,xdot1)
    %Two Simutaneous equation
    % AX = B
    % X = inverse matrix(A)*B
    A =  [  power(t0,3),power(t0,2),t0,1;
          3*power(t0,2),       2*t0, 1,0;
            power(t1,3),power(t1,2),t1,1;
          3*power(t1,2),       2*t1, 1,0];
    
    B =  [   x0;
          xdot0;
             x1;
          xdot1];

    X = inv(A)*B;
    a = X(1,1);
    b = X(2,1);
    c = X(3,1);
    d = X(4,1);
end
