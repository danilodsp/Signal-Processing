%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: moving average filter

clear; clc;

R = 50;
d = rand(R,1)-0.5;
m = 0:1:R-1;
s = 2*m.*(0.9.^m);
x  = s + d';
plot(m,d,'r-',m,s,'b--',m,x,'k:')
xlabel('Tempo n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');

pause

M = input('N�mero de amostras de entrada = ');
b = ones(M,1)/M;
y = filter(b,1,x);
figure (2)
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Tempo n');ylabel('Amplitude')