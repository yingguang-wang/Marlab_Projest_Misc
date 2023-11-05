
T1 =  rotx(45);
T2 = T1 * roty(90);
T3 = T2 * rotz(180);
trplot(T1,'frame','1','color','r');
hold on;
trplot(T2,'frame','2','color','g');
trplot(T3,'frame','3','color','b');
hold off;
xlabel('X');ylabel('Y');zlabel('Z');
