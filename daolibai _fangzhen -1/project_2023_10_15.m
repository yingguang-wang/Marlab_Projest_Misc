clc
clear

% 倒立摆参数
m = 0.5;    % 小车质量
M = 0.2;    % 摆杆质量
l = 0.3;    % 摆杆转动轴心到摆杆质心的长度
I = 0.006;  % 摆杆的质量惯性矩
g = 9.81;   % 重力加速度
b = 0.1;    % 阻尼系数

q = (m+M)*(I+m*l^2)-(m*l)^2;
% 控制方程的分子和分母
fais = [m*l/q, 0, 0];
Us = [1,b*(l+m*l^2)/q, -(m+M)*m*g*l/q,-b*m*g*l/q, 0];
Gs = tf(fais,Us);
[z,p,k] = tf2zp(fais,Us);
% 画伯德图
bode(Gs);   legend('Φ(s)_/U(s)');   xlabel('lgw');
title('倒立摆开环系统伯德图');
% 画奈奎斯特图
figure;
nyquist(Gs);
legend('Φ(s)/U(s)');    xlabel('Re');ylabel('Im');
title('倒立摆开环系统奈奎斯特图');