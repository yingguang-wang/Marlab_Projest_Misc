%help subplot
%subplot(2,1,1);
%x = linspace(0,10);
%y2 = sin(x);
%plot(x,y2)
clear
clc
dt = 0.001;
t1 = -1:dt:1;
x1 = ones( size(t1) );
t2 = 0:dt:3;    
x2 = 0.5 * t2;
y = conv(x1, x2) * dt;
t0 = t1(1) + t2(1);
t3 = length(x1) + length(x2) - 2;
t = t0:dt:(t0 +t3 *dt);
subplot(2,2,1);plot(t1,x1);
title('序列：x1(t)');ylabel('x1(t)');xlabel('t1');grid

subplot(2,2,2);plot(t2,x2);
title('序列：x2(t)');ylabel('x2(t)');xlabel('t2');grid

subplot(2,2,3);plot(t,y);h = get (gca,'position');grid
h(3) = 2.3 * h(3);
set(gca,'position',h)
title('卷积积分：y(t) = x1(t) *x2(t)');xlabel('t');ylabel('y(t)');
clear
