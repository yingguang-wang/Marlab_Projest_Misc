clear
clc
m = 70;     %�ļ�������
g = 9.8;    %�������ٶ�
c1 = 1;     %��������ϵ��1
c2 = 1;     %��������ϵ��2
for k = 20:0.1:50       %��һ���ķ�Χ�����鵯�Գ���
    [t,x,y] = sim('project_2023_12_11_P46',[0,100]);  
    if min(y) > 1.5     %���ñļ��ߵ���С����λ��
        break
    end
end
disp(['��ȫ���Ըն�ϵ��Ϊ', num2str(k)]);
dis = min(y);
disp(['��С����',num2str(dis)]);
simplot(y,t)
