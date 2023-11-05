clear;
clc;
%使用Link类函数，基于DH法建模（改进型）
%@param    theta    d      a      alpha  offset
L1 = Link([  0      0      0      -pi/2  0    ],'modified');    
L2 = Link([  0      0      5      0      0    ],'modified');
L3 = Link([  0      0      5      0      0    ],'modified');
L4 = Link([  0      0      5      0      0    ],'modified');

L1.qlim = [-pi/2,pi/2];

L3.jointtype = 'R';
L1.offset = -pi/4;
L2.offset = -pi/4;
L3.offset =  pi/4;
L4.offset =  pi/4;

robot=SerialLink([L1,L2,L3,L4],'name','RRRR');
robot.display();
robot.teach();
