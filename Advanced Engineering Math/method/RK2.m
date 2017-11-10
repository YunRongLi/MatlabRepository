function output = RK2(varargin)
    % 2nd order RK2
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
                k1 = Interval * x2dot(y(step,1), ydot(step,1));
                l1  = Interval * x1dot(ydot(step,1)); 

                k2 = Interval * x2dot(y(step,1)+l1, ydot(step,1)+k1);
                l2  = Interval * x1dot(ydot(step,1)+k1);

                ydot(step+1,1) = ydot(step,1) + (k1 + k2)/2;    

                y(step+1,1) = y(step,1) +  (l1 + l2)/2;

                output = [y ydot];
            end

    % 3rd order RK2        
    elseif nargin == 8
        % Function
        x1dot = varargin{1};
        x2dot = varargin{2};
        x3dot = varargin{3};
        
        % I.C
        y(1,1) = varargin{4};
        ydot(1,1) = varargin{5};
        ydot(1,1) = varargin{6};
        
        %  Time step;
        Step_max = varargin{8}/varargin{7};
        Interval = varargin{7};
        
        for step = 1:1:Step_max
            Pyddot = Interval * x3dot(y(step,1),ydot(step,1),yddot(step,1));
            Pydot   = Interval * x2dot(y(step,1),ydot(step,1));
            Py        = Interval * x1dot(ydot(step,1));
            
            j1  = Interval * x3dot(y(step,1), ydot(step,1));
            j2  = Interval * x3dot(y(step,1), ydot(step,1));           
            k1 = Interval * x2dot(y(step,1), ydot(step,1));
            k2 = Interval * x2dot(y(step,1)+Py, ydot(step,1)+Pydot);
            l1  = Interval * x1dot(ydot(step,1)); 
            l2  = Interval * x1dot(ydot(step,1)+Pydot);
            
            
            %yddot(step+1,1) = 
            
            ydot(1,step+1) = ydot(1,step) + (k1 + k2)/2;    
            
            y(1,step+1) = y(1,step) +  (l1 + l2)/2;
                
            output = [y;ydot];
        end
end




