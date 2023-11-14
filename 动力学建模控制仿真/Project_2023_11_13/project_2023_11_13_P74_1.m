num = [1];
%达成目的效果,den = [1,0.05,1]
den = [1,0.5,1];
w = 0.05:0.001:0.5 * pi;
Gw = polyval(num, j * w)./polyval(den, j * w);
mag = abs(Gw);
theta = angle(Gw) * 180 / pi;
subplot(2,1,1),plot(w,mag);
grid,title("频率特性");
ylabel('|G|');
subplot(2,1,2),plot(w,theta);
grid,title('相频特性');
xlabel('\omega(rad/s)');
ylabel('dgr');
