function output = MEM(varargin)
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
                P0ydot = x2dot(y(step,1),ydot(step,1));
                P0y      = x1dot(ydot(step,1));
                P1ydot = x2dot(y(step,1) + Interval * P0y, ydot(step,1) + Interval * P0ydot);
                P1y      = x1dot(ydot(step,1) + Interval * P0ydot); 

                ydot(step+1,1) = ydot(step,1) + Interval * (P0ydot + P1ydot)/2;    

                y(step+1,1) = y(step,1) + Interval * (P0y + P1y)/2;

                output = [y ydot];
            end
    end
end


