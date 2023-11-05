clear;
clc;
%使用Link类函数，基于DH法建模（改进型）
%@param    theta    d      a      alpha  offset
L1 = Link([  0      0      0      0      0    ],'modified');%腰转关节    
L2 = Link([  0      149.09 0      -pi/2  0    ],'modified');%肩关节
L3 = Link([  0      0      431.8  0      0    ],'modified');%肘关节
L4 = Link([  0      433.07 20.32  -pi/2  0    ],'modified');%腕偏转
L5 = Link([  0      0      5      pi/2   0    ],'modified');%腕关节俯仰
L6 = Link([  0      0      5      -pi/2  0    ],'modified');%腕关节翻转

L1.qlim = [0, 308];
L2.qlim = [0, 314];
L3.qlim = [0, 292];
L4.qlim = [0, 534];
L5.qlim = [0, 244];
L6.qlim = [0, 578];

robot=SerialLink([L1,L2,L3,L4,L5,L6],'name','RRRR');
robot.display();
robot.teach();
