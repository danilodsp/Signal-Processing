%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: median filter

N = input('Largura do Filtro da Mediana = ');
R = 50; a = rand(1,R)-0.4;
b = round(a); % Gera ru�do impulsivo
m = 0:R-1;
s = 2*m.*(0.9.^m); % Geral sinal
x = s + b; % Sinal corrompido pelo ru�do
y = medfilt1(x,3); % Filtragem

subplot(2,1,1)
stem(m,x);axis([0 50 -1 8]);
xlabel('n');ylabel('Amplitude');
title('Sinal corrompido pelo ru�do');

subplot(2,1,2)
stem(m,y);
xlabel('n');ylabel('Amplitude');
title('Sa�da do filtro da mediana');