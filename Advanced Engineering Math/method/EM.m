function output = EM(varargin)
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
                ydot(step+1,1) = ydot(step,1) + Interval/2 * x2dot(y(step,1),ydot(step,1));    

                y(step+1,1) = y(step,1) + Interval/2 *  x1dot(ydot(step,1));

                output = [y ydot];
            end
    end
end