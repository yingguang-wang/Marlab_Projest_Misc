
clc
clear
t = 0:0.01:5;
num1 = [0 100];
num2 = [0 1000];
den = [1 10 100 600];
sys1 = tf(num1, den);
sys2 = tf(num2, den);
y1 = step(sys1, t);
y2 = step(sys2, t);
y3 = impulse(sys1, t);
u = 3 - t;
y4 = lsim(sys2, u, t);
plot(t,u);
plot(t,y1,t,y2,t,y3,t,y4);
grid;
title('Unit - step respontse','FontSize',20);
xlabel('t(second)','FontSize',20);
ylabel('out poyput y','FontSize',20);
text(0.07,2.8,'x(t)');
text(0.7,2.35,'y(t)');
