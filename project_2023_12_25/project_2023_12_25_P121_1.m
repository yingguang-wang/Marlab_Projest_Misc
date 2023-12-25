clc
clear
ki=0.5;
kd=1;
for kp=0:5:25
    [t,x,y]=sim('unt53',[0:0.01:1000]);
    subplot(3,2,kp/5+1)
    plot(t,y),grid
    ylabel(['kp=',num2str(kp)]);
    xlabel('t/s');
end