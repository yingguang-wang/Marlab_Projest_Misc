%dsolve('D2y = cos(2*x) - y','y(0) = 1','Dy(0) = 0','x')
%clear
clc
x = 1:15;
y = [12 34 56 78 99 123 165 198 243 277 353 345 303 288 275];
p1 = polyfit(x, y, 3);
x1 = 1:0.1;15;
y1 = polyval(p1,x1);
subplot(2,2,1,'replace');
plot(x,y,'bo-',x1,y1);
title('polyfit(x, y, 3)');
xlabel('x');
grid on