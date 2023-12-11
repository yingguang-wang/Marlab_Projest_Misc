%A = [0 1 0; -3 4 0; 0 0 -1];
%B = [0; 1; 1];
%C = [2 1 1];
%%D = 0;
%Uc = [B A*B A^2*B]
%Uo = [C; C*A; C*A^2]
%rank(Uc)
%G = ss(A,B,C,D);
%G1 = tf(G)


% A = [0 1 0; -3 -4 0; 2 1 -2];
% B = [0; 1; 0];
% C = [0 0 1];
% AB = A*B;
% A2B = A^2*B;
% Uc = [B AB A2B]
% rank(Uc)


% A = [0 1 0; -3 -4 0; 2 1 -2];
% B = [0; 1; 0];
% C = [0 0 1];
% AB = A*B;
% A2B = A^2*B;
% Uc = [B AB A2B]
% Uo = [C; C*A; C*A^2]
% rank(Uc)

A = [1 0 0; 2 0 -1; 3 1 0];
B = [0; 1; 0];
C = [1 0 1];
D = 0;

Uc = [B A*B A^2*B]
Uo = [C; C*A; C*A^2]
rank(Uo)
G = ss(A,B,C,D)
G1 = tf(G)