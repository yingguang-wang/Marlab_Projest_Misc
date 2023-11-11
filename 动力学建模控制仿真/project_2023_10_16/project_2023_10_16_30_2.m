clc
clear

x = -10:0.05:10;   y = -8:0.05:8;
[X,Y] = meshgrid(x, y);
Z = sin( sqrt(X.^2+Y.^2) )./ sqrt(X.^2+Y.^2);
mesh(X, Y, Z);hold on;
title('·ÂÕæÊµÀý2£ºz =sin( sqrt(X.^2+Y.^2) )./ sqrt(X.^2+Y.^2) ');
xlabel('X');ylabel('Y');zlabel('Z');
