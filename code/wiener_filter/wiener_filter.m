clear
clc

N=1000;
ts=0.1;
n1=1*randn(1,N);
n2=7*randn(1,N);
t=0:ts:(N-1)*ts;
x1r=2*sin(t);
x2r=sin(t);

s1=-0.7;
s2=-0.5;
a1=0.4;
a2=0.6;
k1=sqrt(1-s1^2);
k2=sqrt(1-s2^2);

xr=a1*x1r+a2*x2r;
%plot(t,xr)

x1(1)=1;
x2(1)=1;

R=[a1^2+a2^2 -a1^2*s1-a2^2*s2; -a1^2*s1-a2^2*s2 a1^2+a2^2];
P=[a2; -a2*s2];

wo=(R^-1)*P;

for k=2:1000
    x1(k)=-s1*x1r(k-1)+k1*n1(k);
    x2(k)=-s2*x2r(k-1)+k2*n2(k);
    x(k)=a1*x1(k)+a2*x2(k);

    y(k)=wo'*[a1*x1(k); a2*x2(k)];
end

e = y - xr;

figure (1)
subplot(2,1,1)
plot(t,x,'LineWidth',1.2)
hold on
plot(t,xr,'r','LineWidth',1.2)
axis([0 100 -5 5])

subplot (2,1,2)
plot (t,y,'LineWidth',1.2)
hold on
plot(t,xr,'r','LineWidth',1.2)
axis([0 100 -5 5])

figure (2)
plot(t,e)