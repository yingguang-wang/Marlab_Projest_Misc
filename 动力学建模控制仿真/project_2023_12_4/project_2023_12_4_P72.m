clc
m1 = 10;
k1 = 10;
u = 1 / 20;
m2 = u * m1;
k2 = u * k1;
cl = 0,0;
pl = sqrt(k1 / m1);
for i = 0:1:5
    c2 = 0.12 * i;
    h1 = conv([m1,c2,k1+k2],[m2,c2,k2]);
    h2 = [0,0,conv([c2,k2],[c2,k2])];
    den = h1 - h2;
    num = [m2,c2,k2];
    w = 0.5:0.01:0.5*pi;
    gw = polyval(num,j*w)./polyval(den,j*w);
    mag = abs(gw);
    plot(w/pl,mag),hold on,grid on
end
axis([0.5,1.5,0,6])
legend('c1=0.60','c2=0.48','c3=0.36','c4=0.24','c5=0.12','c6=0.00')
text(0.98,0.2,'c1')
text(0.98,0.6,'c2')
text(0.96,1.2,'c3')
text(1,1.5,'c4')
text(1,2,'c5')
text(1,2.5,'c6')

