clc
clear
joint = zeros(10, 4); % 创建一个 10 行 4 列的矩阵用于存储关节角度

% 填充不同的姿态到矩阵中，每行对应一个不同的姿态
for i = 1:10
joint(i, :) = [pi/(i*2), pi/(i*4), pi/(i*6), pi/(i*8)];
end
% 定义机械臂关节参数
L1 = Link([0, 0, 0, -pi/2, 0], 'modified');
L2 = Link([0, 0, 5, 0, 0], 'modified');
L3 = Link([0, 0, 5, 0, 0], 'modified');
L4 = Link([0, 0, 5, 0, 0], 'modified');

% 创建机械臂模型
SCARA = SerialLink([L1, L2, L3, L4], 'name', 'SCARA');

% 绘制机械臂轨迹
SCARA.plot(joint, 'jointdiam', 1, 'fps', 10, 'trail', 'r-')