% 机械臂的关节变量
joint_angles = [-pi/2, pi/2, 0, 0, 0, 0];  % 以弧度表示的关节角度

x = cos(joint_angles);  % X坐标
y = sin(joint_angles);  % Y坐标

% 绘制机械臂状态
figure;
plot(x, y, '-o', 'LineWidth', 2);
title('机械臂状态'); xlabel('X-坐标');  ylabel('Y-坐标');
grid on;

% 设置坐标轴范围
axis([-pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2]);

% 添加关节点的标签
hold on;
for i = 1:length(joint_angles)
    plot(x(i), y(i), 'ro', 'MarkerSize', 8);
    text(x(i), y(i), ['Joint ', num2str(i)], 'VerticalAlignment', 'bottom');
end
hold off;