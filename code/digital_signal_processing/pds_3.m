%% Processamento Digital de Sinais DCO - UFRN
% Correlação

clear
close all

% Gerando os sinais
n = -20:0.01:100;
n1 = -5:0.01:25; % tempo para o sinal u(t)
n2 = 10:0.01:40; % atraso de u(t) para v(t)

x = sinc(n);

u = x(1500:4500); % Sinc pura, u(t)
r = 0.1.*randn(1,3001); % Ruído puro, r(t)
v = x(500:3500) + r; % Sinc + ruído, v(t)

y = conv(u,fliplr(v)); % y(t) = correlação de u(t) com v(t)

figure(1)
subplot(4,1,1)
plot(n1,u)
subplot(4,1,2)
plot(n2,r)
subplot(4,1,3)
plot(n2,v)
subplot(4,1,4)
plot(n2,y(500:3500))

%% Mesma coisa com maior ruído

r = 1.2.*randn(1,3001);
v = x(500:3500) + r;

y = conv(u,fliplr(v));

figure(2)
subplot(4,1,1)
plot(n1,u)
subplot(4,1,2)
plot(n2,r)
subplot(4,1,3)
plot(n2,v)
subplot(4,1,4)
plot(n2,y(500:3500))
