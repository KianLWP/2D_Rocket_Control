%% make an animation
close all;
clc;
define_constants;

%Scenario 1 and 2 simulation
% set_param(['AsteroidImpact_2018a', '/rngSeed'], 'Value', '1'); 
% sim('AsteroidImpact_2018a');  % tell simulink to simulate the model

%Scenario 3 simulation
set_param(['AsteroidImpact_Scenario3_2018a', '/rngSeed'], 'Value', '420' ); 
sim('AsteroidImpact_Scenario3_2018a'); 
 
make_animation(simulation_time, x, y, th, ast_x, ast_y, ast_th, ast_dx, ast_dy, 10)
% record_animation(simulation_time, x, y, th, ast_x, ast_y, ast_th, ast_dx, ast_dy)

%% console commands to plot the paths of the rocket and asteroid
% plot(ast_x,ast_y)
% plot(x,y)

%% custom commands
%auto loop
% dist = zeros(1,20);
% ang = zeros(1,20);
% t = zeros(1,20);
% for k = 1:20
%     %Scenario 1, 2
% %     set_param(['AsteroidImpact_2018a', '/rngSeed'], 'Value', int2str((k-1)*200)); 
% %     sim('AsteroidImpact_2018a'); 
% 
%     %Scenario 3
%     set_param(['AsteroidImpact_Scenario3_2018a', '/rngSeed'], 'Value', int2str((k-1)*200)); 
%     sim('AsteroidImpact_Scenario3_2018a');    
%     
%     %Outputs
%     x = ast_x(end);
%     y = ast_y(end);
%     dist(k) = norm([x;y]);
%     %angle
%     th1 = ast_th(end)-pi/2;
%     th2 = th(end);
%     th = th1-th2;
%     th = th-floor(th/(2*pi))*2*pi;
%     if th>pi
%         th = th-2*pi; %-ve angle instead of large +ve
%     elseif th<-pi
%         th = 2*pi+th; %+ve angle instead of large -ve
%     end
%     ang(k) = rad2deg(th);
%     t(k)= simulation_time(end);
% end
%% check whether you succeeded
Scenario = 3;
mission_complete(x, y, ast_x, ast_y, ast_th, Scenario)
