% 5次多项式路径规划
function [x,v,a] = Trapezoid_traj(xs,xe,t,vm)
%% Ducument
% Input:
%   xs, xe: x_start, x_end 1*k
%   vm: v_max 1*k
%   t: time step 1*m
% Output:
%   x, v, a: m*k

%% Code
    k = length(xs);
    ts = t(1);
    te = t(end);

    for i=1:k
        if (abs(xe(i)-xs(i))/(te-ts)) > abs(vm(i))
            V = reset_V(xe(i)-xs(i), te-ts);
            fprintf("Vm(%d) too small, change to %.2f\n", i, V);
        elseif (2*abs(xe(i)-xs(i))/(te-ts)) < abs(vm(i))
            V = reset_V(xe(i)-xs(i), te-ts);
            fprintf("Vm(%d) too big, change to %.2f\n", i, V);
        else
            V = vm(i);
        end

        t_vb = (te-ts) - (xe(i)-xs(i))/V;   % delta time for increasing/decreasing v
        A = V/t_vb;                   
        for j=1:length(t)
            if t(j) <= (t_vb + ts)
                x(j,i) = xs(i) + A/2*(t(j)-ts)^2;
                v(j,i) = A * (t(j)-ts);
                a(j,i) = A;
            elseif t(j) <= (te - t_vb)
                x(j,i) = xs(i) + A/2*t_vb^2 + V*(t(j)-t_vb-ts);
                v(j,i) = V;
                a(j,i) = 0;
            elseif t(j) <= te
                x(j,i) = xs(i) + A/2*t_vb^2 + V*(te-2*t_vb-ts) + V*(t(j)-te+t_vb) - A/2*(t(j)-te+t_vb)^2;
                v(j,i) = V - A*(t(j)-te + t_vb);
                a(j,i) = -A;
            end
        end
    end
end

function V = reset_V(delta_x, delta_t)
    V = delta_x / delta_t *1.2;
end
