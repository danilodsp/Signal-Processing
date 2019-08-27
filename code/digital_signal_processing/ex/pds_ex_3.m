% pds_ex_3

clear

n = -50:50;

M = 4;

x1 = sin(0.125*pi*n);
x2 = sin(0.5*pi*n);

y1 = pds_downsample(x1,M);
%y11(1:M:length(x1)) = y1;
y2 = pds_downsample(x2,M);
%y22(1:M:length(x2)) = y2;


figure (1)

subplot(2,1,1)
plot(n,x1)
hold on
stem((1-51:M:length(x1)-51),y1,'r')
%stem(n,y11,'r')

subplot(2,1,2)
stem((1-51:M:length(x1)-51),y1)

figure (2)

subplot(2,1,1)
plot(n,x2)
hold on
stem((1-51:M:length(x2)-51),y2,'r')
%stem(n,y22,'r')

subplot(2,1,2)
stem((1-51:M:length(x2)-51),y2)