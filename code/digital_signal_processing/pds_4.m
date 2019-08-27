%% Processamento Digital de Sinais DCO - UFRN
% Correlação

clear
close all

N = 96;
n = 1:N;
x = cos(pi*0.25*n); % sinal senoídal puro, x(t)
d = randn(1,N); % ruído, d(t)
y = x + d; % sinal corrompido com ruído, y(t)
r = conv(y, fliplr(y)); % autocorrelação, r(t)
k = -28:28;

figure(1)
subplot(4,1,1)
stem(n, x);
subplot(4,1,2)
stem(n, d);
subplot(4,1,3)
stem(n, y);
subplot(4,1,4)
stem(k, r(68:124));