function ra = quat2ra(quat)
%% Ducument: unitquaternion -> rotation by axis
% Input: 
%   quat: unitquaternion [q0, qv]
% Output:
%   ra: [theta, k]

    ra = zeros(1,4);
    if strcmp(class(quat),'UnitQuaternion')
        quat = double(quat);
    end
    ra(1) = 2*acos(quat(1));
    ra(2:4) = quat(2:4)/norm(quat(2:4));
end