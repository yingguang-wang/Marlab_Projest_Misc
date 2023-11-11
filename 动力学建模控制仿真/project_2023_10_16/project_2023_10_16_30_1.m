clc
clear
%x = 0:0.01:20;
%x = x';
%y1 = sin(x);y2 = 100*cos(x);
%plotyy(x,y1,x,y2),grid

x = -5:0.5:5;   y = x;
[X,Y] = meshgrid(x, y);
Z = X.^2+Y.^2;
surf(X, Y, Z);
title('·ÂÕæÊµÀý1£ºz = x^2 + y^2');xlabel('X');ylabel('Y');zlabel('Z');
hold on;