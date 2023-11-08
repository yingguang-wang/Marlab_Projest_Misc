function w = my_dquaternion2w(q,dq)
% my_dquaternion2w: 根据四元数q和角速度w，求解四元数导数
%   q: 4*1 四元数 [q0 qv]
%   dq: 4*1 四元数导数
%   w: 3*1 角速度
E=[ -q(2) -q(3) -q(4);
     q(1)  q(4) -q(3);
    -q(4)  q(1)  q(2);
     q(3) -q(2)  q(1)];
w=2*E'*dq;
end
