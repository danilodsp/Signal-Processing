clear
clc
close all

%planta
dt=0.1;
t=0:dt:30;
l=length(t);
u=zeros(1,l);
x=zeros(2,l);
xe=zeros(2,l);
dados=zeros(3,l-2);
% A=[0 1;-1 -1];
% B=[0;1];
% C=[1 1];
A=[-1 1;-1 0];
B=[1;1];
C=[1 0];

%estimação
%estimações
teta = [-1.2;-1.1;0.9;1.1];
% teta = [-1;-1;1;1];
P1 = ones(2,2); %2x2 ??????
P2 = zeros(2,4); %2x4
P3 = ones(4,4); %4x4 ???????
Ae = [teta(1) 1;teta(2) 0];
be = [teta(3);teta(4)];
Ce = [1 0];


for i=1:1:l
    if (i<=10)
        u(i)=t(i);
    else
        u(i)=1;
    end
    x([1:1:end],i+1)=x([1:1:end],i)+[A*x([1:1:end],i)+B*u(i)]*dt;
    y(i)=C*x([1:1:end],i);
        
    
    w = randn(2,1);
    e = randn(1,1);
    R1 = w*w'; %????
    R2 = e*e'; %????
    S = Ce*P1*Ce'+ R2; %S 2x2
    K = P1*Ce'*inv(S); %k 2x1
    L = P2'*Ce'*inv(S); %L 4x1
    M = [xe(1,i) 0 u(1,i) 0;0 xe(2,i) 0 u(1,i)]; %M 2x4 ??????
%     M = [teta(1)*xe(1,i) 0 teta(3)*u(1,i) 0;0 teta(2)*xe(2,i) 0 teta(4)*u(1,i)]; %M 2x4
    P1 = Ae*P1*Ae' + Ae*P2*M' + M*P2'*Ae' + M*P3*M' - K*S*K' + R1; %P1 2x2
    P2 = (Ae - K*Ce)*P2 + M*P3; %P2 2x4
    P3 = P3 - L*S*L'; %P3 4x4
    xe(:,i+1)=xe(:,i) + [Ae*xe(:,i) + be*u(i) + K*(y(i)-Ce*xe(:,i))]*dt;
%     ye(i)=C*xe([1:1:end],i);
    ye(i) = y(i);
    teta = teta + L*(y(i)-Ce*xe(:,i)); % 4x1  
    
end
figure
plot(t,x(1,1:(end-1)),'r');
hold on
plot(t,x(2,1:(end-1)),'g');
hold on
% plot(t,y);
% legend('x1','x2','y');
% 
% figure
plot(t,xe(1,1:(end-1)),'m');
hold on
plot(t,xe(2,1:(end-1)),'y');
hold on
% plot(t,ye,'k');
% legend('xe1','xe2','ye');
legend('x1','x2','xe1','xe2');

disp('   Tetaest   tetareal')
disp([teta [A(1);A(2);B(1);B(2)]])