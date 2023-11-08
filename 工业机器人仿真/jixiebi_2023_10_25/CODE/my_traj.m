function [x,v] = my_traj(T_start, T_end, t)
%% Ducument: simplay trajector plan: for p: use 5 poly and for o: use trapezoid
% Input:
%   T_start: initial T SE3 or 4*4
%   T_end: final T SE3 or 4*4
%   t: time step 1*T
% Output:
%   x: postion and oriention 7*T
%   v: dp and w 6*T

%% Code
%%从结构取初始和最终齐次矩阵
if isa(T_start,'SE3') && isa(T_end,'SE3')
    T_start = double(T_start);
    T_end = double(T_end);
end   

%% 对空间位置进行规划
% for p: use 5 poly
p_start = T_start(1:3,4);  %取初始位移
p_end = T_end(1:3,4);   % 取最终位移
[p,dp,~] = Quintic_traj(p_start',p_end',[0,0,0],[0,0,0],[0,0,0],[0,0,0],t);  % 5次多项式规划求位移和速度

%% 对空间姿态进行规划
% for o: use trapezoid
o_start = UnitQuaternion(T_start);  %四元数转换初始姿态
o_end = UnitQuaternion(T_end);  %四元数转换最终姿态
R_start = T_start(1:3,1:3);  %取初始旋转矩阵
delta_o = inv(o_start)*o_end;
delta_k = quat2ra(delta_o);   %计算
axis = R_start * delta_k(2:4)';    % axis to {O}
[theta,dtheta,~] = Trapezoid_traj(0, delta_k(1), t, 0.3);   % 梯形规划获取轴角转动的速度

x = zeros(7,length(t));
v = zeros(6,length(t));
for i = 1:length(t)
    x(1:3,i) = p(i,:)';  %位移
    v(1:3,i) = dp(i,:)';   %速度
    temp_k(1) = theta(i);   %四元数角度
    temp_k(2:4) = delta_k(2:4);    %四元数角速度        
    x(4:7,i) = double(o_start * UnitQuaternion(ra2quat(temp_k)));   %位移
    v(4:6,i) = dtheta(i) * axis;   %角速度*轴长=线速度
end
end

%% 说明
% delta_k: 对应[theta, A^k_B]，姿态A 沿{A}中转轴转theta角 到姿态B
% axis：将A^k_B映射，{A}中转轴映射到{O}中转轴，姿态A 沿{O}中axis转theta角 到姿态B
% 注意：对于中间过程：虽然theta已知，即轴角差已知，但是中间姿态在{O}下的轴角表示未知
% 所以这里必须在{A}下先转换为A^ quat_C，其中C是中间位置，再变到O^ quat_C
