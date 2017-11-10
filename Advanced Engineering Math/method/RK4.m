function output = RK4(varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin == 6
        % Function
        x1dot = varargin{1};
        x2dot = varargin{2};
        
        % I.C
        y(1,1) = varargin{3};
        ydot(1,1) = varargin{4};
        
        %  Time step;
        Step_max = varargin{6}/varargin{5};
        Interval = varargin{5};
        
        for step = 1:1:Step_max
            k1 = x2dot(y(step,1), ydot(step,1));
            l1  = x1dot(ydot(step,1)); 
          
            k2 = x2dot(y(step,1) + Interval * l1/2, ydot(step,1) + Interval * k1/2);
            l2  = x1dot(ydot(step,1) + Interval * k1/2);
            
            k3 = x2dot(y(step,1) + Interval * l2/2, Interval * k2/2);
            l3  = x1dot(ydot(step,1) + Interval * k2/2);
            
            k4 = x2dot(y(step,1) + Interval * l3, Interval * k3);
            l4  = x1dot(ydot(step,1) + Interval * k3);       
            
            ydot(step+1,1) = ydot(step,1) + Interval *  (k1 + 2 * k2 + 2 * k3 + k4)/6;    
            
            y(step+1,1) = y(step,1) + Interval * (l1 + 2 * l2 + 2 * l3 + l4)/6;
                
            output = [y ydot];
        end
elseif nargin == 8
        % Function
        x1dot = varargin{1};
        x2dot = varargin{2};
        x3dot = varargin{3};
        
        % I.C
               y(1,1) = varargin{4};
          ydot(1,1) = varargin{5};
        yddot(1,1) = varargin{6};
        
        %  Time step;
        Step_max = varargin{8}/varargin{7};
        Interval = varargin{7};
        
        for step = 1:1:Step_max
            k1 = x3dot(y(step,1), ydot(step,1), yddot(step,1));
            l1  = x2dot(yddot(step,1));
            j1  = x1dot(ydot(step,1));
            
            k2 = x3dot(y(step,1) + Interval * j1/2, ydot(step,1) + Interval * l1/2, yddot(step,1) + Interval * k1/2);
            l2  = x2dot(yddot(step,1) + Interval * k1/2);
            j2  = x1dot(ydot(step,1) + Interval * l1/2);

            k3 = x3dot(y(step,1) + Interval * j2/2, ydot(step,1) + Interval * l2/2, yddot(step,1) + Interval * k2/2);
            l3  = x2dot(yddot(step,1) + Interval * k2/2);
            j3  = x1dot(ydot(step,1) + Interval * l2/2);
            
            k4 = x3dot(y(step,1) + Interval * j3, ydot(step,1) + Interval * l3, yddot(step,1) + Interval * k3);
            l4  = x2dot(yddot(step,1) + Interval * k3);
            j4  = x1dot(ydot(step,1) + Interval * l3);
            
            yddot(step+1,1) = yddot(step,1) + Interval * (k1 + 2 * k2 + 2 * k3 + k4)/6;
            
            ydot(step+1,1) = ydot(step,1) + Interval * (l1 + 2 * l2 + 2 * l3 + l4)/6;    
            
            y(step+1,1) = y(step,1) +  Interval * (j1 + 2 * j2 + 2 * j3 + j4)/6;
                
            output = [y ydot yddot];
        end
end
