% Robotics and Vision Homework02_01 Trajetory planning

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
               0,1.0, 0.5*pi,0;];
            
for seg = 1:1:3
            [xa,xb,xc,xd] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(1,seg),velocity(1,seg),postion(1,seg+1),velocity(1,seg+1));
            [ya,yb,yc,yd] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(2,seg),velocity(2,seg),postion(2,seg+1),velocity(2,seg+1));
    [phia,phib,phic,phid] = CubiPolynomialVector(t(seg,1),t(seg+1,1),postion(3,seg),velocity(3,seg),postion(3,seg+1),velocity(3,seg+1));
    
          x_position = @(t)xa*power(t,3) + xb*power(t,2) + xc*t + xd;
          x_velocity = @(t)3*xa*power(t,2) + 2*xb*t + xc;
      x_acceleration = @(t)6*xa*t + 2*xb;
 
          y_position = @(t)ya*power(t,3) + yb*power(t,2) + yc*t + yd;
          y_velocity = @(t)3*ya*power(t,2) + 2*yb*t + yc;
      y_acceleration = @(t)6*ya*t + 2*yb;

               angle = @(t)  phia*power(t,3) + phib*power(t,2) + phic*t + phid;
    angular_velocity = @(t)3*phia*power(t,2) + 2*phib*t + phic;
angular_acceleration = @(t)6*phia*t + 2*phib;

      
      t_interval = linspace(t(seg,1),t(seg+1,1));
   
      subplot(3,2,1)
      title('Position');
      xlabel('t(sec)');
      ylabel('Position(m)');
      plot(t_interval,x_position(t_interval),'b');
      hold on
      plot(t_interval,y_position(t_interval),'g');
      hold on
      legend({'x(t)';'y(t)'},'Interpreter','latex','Location','northwest','FontSize',16);
      grid
      
      subplot(3,2,2)
      title('Angle');
      xlabel('t(sec)');
      ylabel('Angle(rad)');
      plot(t_interval,angle(t_interval),'r');
      hold on
      legend({'$\phi(t)$'},'Interpreter','latex','Location','northwest','FontSize',16);
      grid
      
      subplot(3,2,3)
      title('Velocity');
      xlabel('t(sec)');
      ylabel('Velocity(m/sec)');
      plot(t_interval,x_velocity(t_interval),'b');
      hold on
      plot(t_interval,y_velocity(t_interval),'g');
      hold on
      legend({'$\dot{x}(t)$';'$\dot{y}(t)$'},'Interpreter','latex','FontSize',16);
      grid
      
      subplot(3,2,4)
      title('Angular Velocity');
      xlabel('t(sec)');
      ylabel('Angular Velocity(rad/sec)');
      plot(t_interval,angular_velocity(t_interval),'r');
      hold on
      legend({'$\dot{\phi}(t)$'},'Interpreter','latex','FontSize',16);
      grid
      
      subplot(3,2,5)
      title('Acceleration');
      xlabel('t(sec)');
      ylabel('Acceleration(m/sec^2)');
      plot(t_interval,x_acceleration(t_interval),'b');
      hold on
      if(seg > 1)
            plot([t(seg,1) t(seg,1)],[x_a_before x_acceleration(t(seg,1))],'b')
      end
      plot(t_interval,y_acceleration(t_interval),'g');
      hold on
      if(seg > 1)
            plot([t(seg,1) t(seg,1)],[y_a_before y_acceleration(t(seg,1))],'g')
      end
      legend({'$\ddot{x}(t)$';'$\ddot{y}(t)$'},'Interpreter','latex','Location','northwest','FontSize',16);
      grid
      
      subplot(3,2,6)
      title('Angular Acceleration');
      xlabel('t(sec)');
      ylabel('Angular Acceleration(rad/sec^2)');
      plot(t_interval,angular_acceleration(t_interval),'r');
      hold on
      if(seg > 1)
            plot([t(seg,1) t(seg,1)],[ang_a_before angular_acceleration(t(seg,1))],'r')
      end
      legend({'$\ddot{\phi}(t)$'},'Interpreter','latex','FontSize',16);
      grid
      
      x_a_before = x_acceleration(t(seg+1,1));
      y_a_before = y_acceleration(t(seg+1,1));
      ang_a_before = angular_acceleration(t(seg+1,1));
end






