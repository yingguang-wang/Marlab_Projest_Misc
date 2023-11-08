% 5次多项式路径规划
function [x,v,a] = Quintic_traj(xs,xe,vs,ve,as,ae,t)
%% Ducument
% Input:
%   xs, xe: x_start, x_end 1*k
%   vs, ve: v_start, v_end 1*k
%   as, ae: a_start, a_end 1*k
%   t: time step 1*m
% Output:
%   x, v, a: m*k

%% Code
    k = length(xs);
    ts = t(1);
    te = t(end);
    A = [   ts^5     ts^4    ts^3    ts^2  ts  1;
          5*ts^4   4*ts^3  3*ts^2  2*ts    1   0;
         20*ts^3  12*ts^2  6*ts      2     0   0;
            te^5     te^4    te^3    te^2  te  1;
          5*te^4   4*te^3  3*te^2  2*te    1   0;
         20*te^3  12*te^2  6*te      2     0   0;];
    b = [xs; vs; as; xe; ve; ae];


    for i=1:k
        coefficient_x = A \ b(:,i);
        coefficient_v = coefficient_x(1:5).* (5:-1:1)';
        coefficient_a = coefficient_v(1:4).* (4:-1:1)';
        x(:,i) = polyval(coefficient_x, t);
        v(:,i) = polyval(coefficient_v, t);
        a(:,i) = polyval(coefficient_a, t);
end
