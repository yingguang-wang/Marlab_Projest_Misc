clc
clear

% 创建时间变量t，范围从0到1
t = linspace(0, 1, 50);

% 定义起点和终点   first | second
%                 point | point
start_position = [0     ; 0    ];
end_position =   [1     ; 1    ];
% 定义两端速度        start | end
%                    speed | speed
first_point_speed  = [0    ; 0   ];
second_point_speed = [1    ; 1   ];

% 使用tpoly进行5次多项式插值，两端速度为（0，0）
trajectory_zero = tpoly(start_position(1), end_position(1), t, first_point_speed(1), first_point_speed(2) );

% 使用tpoly进行5次多项式插值，两端速度为（1，1）
trajectory_one  = tpoly(start_position(2), end_position(2), t, second_point_speed(1), second_point_speed(2));

% 绘制轨迹和速度
figure;
subplot(2,2,1);
plot(t, trajectory_zero);
title('两端(0, 0) 轨迹');
xlabel('Time (0 to 1)');
ylabel('Position');

subplot(2,2,2);
plot(t, trajectory_one);
title('两端(1, 1) 轨迹');
xlabel('Time (0 to 1)');
ylabel('Position');

% 计算速度
velocity_zero_velocity = gradient(trajectory_zero);
velocity_unit_velocity = gradient(trajectory_one);

% 绘制速度

subplot(2,2,3);
plot(t, velocity_zero_velocity);
title('两端(0, 0)，速度');
xlabel('Time (0 to 1)');
ylabel('Velocity');

subplot(2,2,4);
plot(t, velocity_unit_velocity);
title('两端(1, 1)，速度');
xlabel('Time (0 to 1)');
ylabel('Velocity');
