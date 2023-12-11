clear 
clc
n_N=1500;R_a=0.18;R_f=628;
U_N=220;P_N=22;I_N=115;

Ia_N=I_N-U_N/R_f;
C_Ephi_N=(U_N-R_a*Ia_N)/n_N;
C_Tphi_N=9.55*C_Ephi_N;

C_EPhi_N=(U_N-R_a*Ia_N)/n_N;
C_TPhi_N=9.55*C_EPhi_N;
Ia=0:Ia_N;
n=U_N/C_EPhi_N-R_a/(C_EPhi_N)*Ia;
Te=C_TPhi_N*Ia;
P1=U_N*Ia+U_N*U_N/R_f;
T2_N=9550*P_N/n_N;
figure(1);
plot(Te,n,'.-');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
ylim([0,1800]);

figure(2);
plot(Te,n,'rs');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
hold on;
R_c=0;
for coef=1:-0.25:0.25
U=U_N*coef;
n=U/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;

plot(Te,n,'k-');
str = strcat('U =',num2str(U),'V');
s_y=1650*coef;
text(50,s_y,str);
end

figure(3);
n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;
plot(Te,n,'rs');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
hold on;

for R_c=0:0.5:1.9
plot(Te,n,'k-');
str=strcat('R=',num2str(R_c+R_a),'\Omega');
s_y=400*(4-R_c*1.8);
text(120,s_y,str);
end  
%n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;

ylim([0,1700]);

figure(4);
R_c=0;
n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;
plot(Te,n,'rs');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
hold on;
U=U_N;R_c=0;
for coef=0.5:0.25:1.3
C_EPhi=C_EPhi_N*coef;
C_TPhi=C_TPhi_N*coef;
n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;
plot(Te,n,'k-');
%str=strcat('\phi=',num2str(coef),'\phi_N');
str=strcat('\phi=',num2str(coef),'*\phi_N');
s_y=900*(4-coef*2.2);
text(120,s_y,str);
end
ylim([0,3500]);
for coef=0.5:0.25:1.3
C_EPhi=C_EPhi_N*coef;
C_TPhi=C_TPhi_N*coef;
n=U/C_EPhi-(R_a+R_c)/(C_EPhi*C_TPhi)*Te;
plot(Te,n,'k-');
str=strcat('\phi=',num2str(coef),'*\phi_N');
s_y=900*(4-coef*2.2);
text(120,s_y,str);
end
ylim([0,3500]);
figure(4);
R_c=0;
n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;
plot(Te,n,'rs');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
hold on;

figure(4);
R_c=0;
n=U_N/C_EPhi_N-(R_a+R_c)/(C_EPhi_N*C_TPhi_N)*Te;
plot(Te,n,'rs');
xlabel('电磁转矩Te/N.m');
ylabel('转速n/rpm');
hold on;
U=U_N;R_c=0;
for coef=0.5:0.25:1.3
C_EPhi=C_EPhi_N*coef;
C_TPhi=C_TPhi_N*coef;
n=U/C_EPhi-(R_a+R_c)/(C_EPhi*C_TPhi)*Te;
plot(Te,n,'k-');
str=strcat('\phi=',num2str(coef),'*\phi_N');
s_y=900*(4-coef*2.2);
text(120,s_y,str);
end
ylim([0,3500]);
