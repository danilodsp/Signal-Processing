clear
clc
close all

% Planta
h = 0.001;
t = 0:h:6;
l = length(t);
u = zeros(1,l);
x = zeros(2,l);
xe = zeros(2,l);

% Sistema
A = [-4 1;-4 0];
B = [1;1];
C = [1 0;0 1];

% Inicializações
x = [0.15; 0];
teta = [-4.1; 1; -3.9; 0; 0.91; 1.1];
xe = [0; 0]; %2x1
FI = [xe(1,1) 0; xe(2,1) 0; 0 xe(1,1); 0 xe(2,1); u(1) 0; 0 u(1)]'; %2x4
% Px = cov(xe,xe); %2x2
Px = diag([1 1]);
% Pxteta = cov(xe,teta);
Pxteta = xe*teta'; %2x4
% Pxteta = zeros(2,4);
Ptetax = Pxteta';
% Pteta = cov(teta,teta); %2x2
% Pteta = teta*teta';
Pteta = diag([1 1 1 1 1 1]);
% Pteta = diag(teta);
% v = 0.5*randn(2,2);
% R = cov(v(:,1),v(:,2));
R = diag([.01 .01]);

Ae = [teta(1) teta(2); teta(3) teta(4)];
be = [teta(5); teta(6)];
Ce = [1 0;0 1];

for k=1:1:l
%     if (k<=10)
%         u(k)=t(k);
%     else
        u(k)=1;
%     end

    % Planta
    x([1:1:end],k+1) = x([1:1:end],k) + [A*x([1:1:end],k) + B*u(k)]*h;
    y(:,k) = C*x([1:1:end],k);
    
    % Observador    
    Px_post = Ae*Px*Ae' + FI*Pteta*FI' + Ae*Pxteta*FI' + FI*Ptetax*Ae';
    Pxteta_post = Ae*Pxteta +FI*Pteta;
    Ptetax_post = Pxteta_post';
    Pteta_post = Pteta;
    Kx = Px_post*inv(R+Px_post);
    Kteta = Ptetax_post*inv(R+Px_post);
    Px = Px_post - Kx*Px_post;
    Pxteta = Pxteta_post - Kx*Pxteta_post;
    Ptetax = Pxteta';
    Pteta = Pteta_post - Kteta*Pxteta_post;
    e = y(:,k) - FI*teta;
    xe([1:1:end],k+1) = FI*teta + Kx*e;
    teta = teta + Kteta*e;
    FI = [xe(1,k+1) 0; xe(2,k+1) 0; 0 xe(1,k+1); 0 xe(2,k+1); u(1) 0; 0 u(1)]'; %2x4
    Ae = [teta(1) teta(2); teta(3) teta(4)];
    be = [teta(5); teta(6)];
    
    ye(:,k) = Ce*xe([1:1:end],k);
end

figure
hold on
plot(t,y(1,:),'k');
plot(t,ye(1,:),'r:');
legend('y','ye');

figure
hold on
plot(t,x(1,1:(end-1)),'r');
plot(t,xe(1,1:(end-1)),'m:');
legend('x1','xe1');

figure
hold on
plot(t,x(2,1:(end-1)),'g');
plot(t,xe(2,1:(end-1)),'b:');
legend('x2','xe2');

disp('Tetaest tetareal')
disp([teta [A(1);A(2);A(3);A(4);B(1);B(2)]])