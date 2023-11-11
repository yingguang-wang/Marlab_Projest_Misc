clc
clear

x = 0:0.05:1;   y = x;
[X,Y] = meshgrid(x, y);
Z = sin(pi * X) .* sin(2 * pi * Y);
%mesh(X, Y, Z);%hold on;
surf(X, Y, Z);
title('·ÂÕæÊµÀý3£ºZ = sin(pi * X) .* sin(2 * pi * Y) ');
xlabel('X');ylabel('Y');zlabel('Z');
