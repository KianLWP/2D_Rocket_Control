m=10000;
g = 9.81;
dx = c_dx;
dy = c_dy;
ddx = c_ddx;
ddy = c_ddy;
%d: drag
Fd_x = ddx*m;
Fd_y = (ddy+g)*m;
Fd = sqrt(Fd_y.^2+Fd_x.^2);
temp = Fd./sqrt(dx.^2+dy.^2); 
c = [c, mean(temp)]

%commands
%c=[];
%mean(c)
%range(c)