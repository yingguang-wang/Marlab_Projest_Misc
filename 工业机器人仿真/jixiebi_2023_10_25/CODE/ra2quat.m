function quat = ra2quat(ra,unit_flag)
%% Ducument: unitquaternion -> rotation by axis
% Input: 
%   ra: [theta, k]
% Output:
%   quat: unitquaternion [q0, qv]

    quat(1) = cos(ra(1)/2);
    quat(2:4) = sin(ra(1)/2) * ra(2:4);
    if nargin > 2
        quat = UnitQuaternion(quat);
    end
end