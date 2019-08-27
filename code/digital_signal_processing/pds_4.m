%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: correlation

clear
close all

N = 96;
n = 1:N;
x = cos(pi*0.25*n); % sinal seno�dal puro, x(t)
d = randn(1,N); % ru�do, d(t)
y = x + d; % sinal corrompido com ru�do, y(t)
r = conv(y, fliplr(y)); % autocorrela��o, r(t)
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