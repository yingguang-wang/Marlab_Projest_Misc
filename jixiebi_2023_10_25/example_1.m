
%T = SE2(1,2,30,'deg');%角度制
%trplot2(T,'frame','A','color','r');
%point = [3;2];
%point1 = T * point;
%disp(point1)

%T = SE2(1,2,pi/6);%弧度制
%trplot2(T,'frame','A','color','r');

%T = SE2(2,1,0,'deg');%角度制
%trplot2(T,'frame','A','color','r');
%point = [3;2];
%point1 = T * point;
%disp(point1)


%T = SE2(2,1,0,'deg')*SE2(1,2,30,'deg');%角度制
%trplot2(T,'frame','A','color','r');
%point = [3;2];
%point1 = T * point;
%disp(point1)

T = SE2(1,2,30,'deg')*SE2(2,1,0,'deg');%角度制
trplot2(T,'frame','A','color','r');
point = [3;2];
point1 = T * point;
disp(point1);


