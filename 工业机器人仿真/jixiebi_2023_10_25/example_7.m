% 创建一个 m x n 的关节变量矩阵，其中 m 是姿态的数量，n 是关节的数量
m = 10;  % 假设有10个不同的姿态
n = 4;   % 假设机械臂有4个关节

joint = zeros(m, n);  % 初始化关节变量矩阵

% 在每个姿态下设置不同的关节角度
for i = 1:m
    joint(i, 1) = pi/6 + (i-1) * (pi/6);  % 假设关节1的角度范围从 pi/6 到 pi/2
    joint(i, 2) = i * (pi/24);             % 假设关节2的角度范围从 0 到 pi/4
    joint(i, 3) = pi/3 + -(i-1) * (pi/18);  % 假设关节3的角度范围从 pi/3 到 -pi/2
    joint(i, 4) = i * (160/9);             % 假设关节4的角度范围从 0 到 160
end

% 计算每个姿态对应的末端位姿
endEffectorPoses = SCARA.fkine(joint);

% 提取末端位姿的位置信息
endEffectorPositions = transl(endEffectorPoses);

% 绘制机械臂的轨迹
figure;
hold on;
for i = 1:m
    plot3(endEffectorPositions(i, 1), endEffectorPositions(i, 2), endEffectorPositions(i, 3), 'bo', 'MarkerSize', 10);
end
grid on;
xlabel('X');    ylabel('Y');    zlabel('Z');
title('机械臂末端位姿轨迹');
% 显示机械臂的模型
SCARA.plot(joint);