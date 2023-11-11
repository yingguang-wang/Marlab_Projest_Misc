clc
clear
x = 0:0.01:20;
x = x';
y1 = sin(x);y2 = 100*cos(x);
z1 = sin(x + 0.5);z2 = exp(x/4);z3 = x.^2;
plotyy(x,[y1,x,y2,],x,[z1,z2,z3]);
title('z1 = sin(x + 0.5);z2 = exp(x/4);z3 = x.^2');xlabel('X');ylabel('Y_{1}');
grid

