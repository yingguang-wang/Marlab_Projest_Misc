function [dq] = dq_solver(dx,delta_x,J,q)
% dq_solver WLN方法下由末端速度求解实关节速度 -- 式（42）
%   dx：m*1 目标末端速度
%   delta_x: m*1 当前位置与目标位置差 x - xd 
%   J：m*n 当前雅各比矩阵
%   q：n*1 当前关节角度
%   dq：n*1 对应关节速度指令
%   Q: 3*2 空间线段端点

P=Priority_matrix(q);                           % P    对角权重矩阵
P_inv = inv(P);                                 % P^-1==Wv^-1
display(P);
lambda=0.01;                                    % J_v

k = 1; 
dq = P_inv*J'*inv(J*P_inv*J'+lambda^2*eye(6))*(dx-k*delta_x);             % PD控制
end