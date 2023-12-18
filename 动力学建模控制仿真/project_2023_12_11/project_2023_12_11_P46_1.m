clear
clc
m = 70;     %蹦极者质量
g = 9.8;    %重力加速度
c1 = 1;     %空气阻力系数1
c2 = 1;     %空气阻力系数2
for k = 20:0.1:50       %在一定的范围内试验弹性常数
    [t,x,y] = sim('project_2023_12_11_P46',[0,100]);  
    if min(y) > 1.5     %设置蹦极者的最小绝对位置
        break
    end
end
disp(['安全弹性刚度系数为', num2str(k)]);
dis = min(y);
disp(['最小距离',num2str(dis)]);
simplot(y,t)
