function P = Priority_matrix(q)
% Priority_matrix: 对角权重矩阵
%   q: n*1 关节角度
%   P: (n+r)*(n+r) 对角权重矩阵

[n,~]=size(q);
P=zeros(n,n);

%% 对于实际关节限位 -- 参见式（33）和式（34）    
qmax=[170;0;141;165;105;180]*pi/180;            % 关节最大限位
qmin=[-170;-132;1;-165;-105;-180]*pi/180;       % 关节最小限位
qmax_margin=qmax-10*pi/180;                      % 上限裕量
qmin_margin=qmin+10*pi/180;                      % 下限裕量
d=zeros(n,1);
for i=1:n
    if (q(i)<=qmin_margin(i)) && (q(i)>=qmin(i))
        d(i)=(q(i)-qmin(i))/(qmin_margin(i)-qmin(i));
    elseif (q(i)>=qmax_margin(i)) && (q(i)<=qmax(i))
        d(i)=(qmax(i)-q(i))/(qmax(i)-qmax_margin(i));
    elseif (q(i)>qmax(i)) || (q(i)<qmin(i))
        d(i)=-1;
    else
        d(i)=1;
    end
    
    if d(i)<=0
        P(i,i)=1e10;
    else
        P(i,i)=1+(1-d(i))^5/d(i)^5;
    end
end
end

