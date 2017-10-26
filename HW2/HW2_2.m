% HW2_2

clear;clc;

%  Boundary Condition
            t = [0;
                 2;
                 3;
                 4];
            
   postion  = [0,2.0,0.5,0.0;
               0,1.0,2.0,0.5;
               0,1.0, pi, pi];
           
   velocity = [0,0.5, 1.0,0;
               0,1.0,-0.5,0;
               0,1.0, 0.5,0;];
            
for seg = 1:1:3
            [xa,xb,xc,xd] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(1,seg),velocity(1,seg),postion(1,seg+1),velocity(1,seg+1));
            [ya,yb,yc,yd] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(2,seg),velocity(2,seg),postion(2,seg+1),velocity(2,seg+1));
    [phia,phib,phic,phid] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(3,seg),velocity(3,seg),postion(3,seg+1),velocity(3,seg+1));
    
          x_position = @(t)xa*t.^3 + xb*t.^2 + xc*t + xd;
          x_velocity = @(t)      3*xa*t.^2 + 2*xb*t + xc;
      x_acceleration = @(t)                3*xa*t + 2*xb;
 
          y_position = @(t)ya*t.^3 + yb*t.^2 + yc*t + yd;
          y_velocity = @(t)      3*ya*t.^2 + 2*yb*t + yc;
      y_acceleration = @(t)                3*ya*t + 2*yb;

               angle = @(t)phia*t.^3 + phib*t.^2 + phic*t + phid;
    angular_velocity = @(t)        3*phia*t.^2 + 2*phib*t + phic;
angular_acceleration = @(t)                    3*phia*t + 2*phib;

      t_interval = linspace(t(seg,1),t(seg+1,1));
   
      subplot(3,1,1)
      title('Position');
      xlabel('t(s)');   
      plot(t_interval,x_position(t_interval),'b');
      hold on
      plot(t_interval,y_position(t_interval),'g');
      hold on
      plot(t_interval,angle(t_interval),'r');
      hold on
      legend({'x(t)';'y(t)';'$\phi(t)$'},'Interpreter','latex','Location','northwest','FontSize',16);
      grid
   
      subplot(3,1,2)
      title('Velocity');
      xlabel('t(s)');
      plot(t_interval,x_velocity(t_interval),'b');
      hold on
      plot(t_interval,y_velocity(t_interval),'g');
      hold on
      plot(t_interval,angular_velocity(t_interval),'r');
      hold on
      legend({'$\dot{x}(t)$';'$\dot{y}(t)$';'$\dot{\phi}(t)$'},'Interpreter','latex','FontSize',16);
      grid
      
      subplot(3,1,3)
      title('Acceleration');
      xlabel('t(s)');
      plot(t_interval,x_acceleration(t_interval),'b');
      hold on
      plot(t_interval,y_acceleration(t_interval),'g');
      hold on
      plot(t_interval,angular_acceleration(t_interval),'r');
      hold on
      legend({'$\ddot{x}(t)$';'$\ddot{y}(t)$';'$\ddot{\phi}(t)$'},'Interpreter','latex','FontSize',16);
      grid
end






