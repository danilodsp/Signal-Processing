%% Processamento Digital de Sinais - DCO UFRN
% Filtro da mediana

N = input('Largura do Filtro da Mediana = ');
R = 50; a = rand(1,R)-0.4;
b = round(a); % Gera ruído impulsivo
m = 0:R-1;
s = 2*m.*(0.9.^m); % Geral sinal
x = s + b; % Sinal corrompido pelo ruído
y = medfilt1(x,3); % Filtragem

subplot(2,1,1)
stem(m,x);axis([0 50 -1 8]);
xlabel('n');ylabel('Amplitude');
title('Sinal corrompido pelo ruído');

subplot(2,1,2)
stem(m,y);
xlabel('n');ylabel('Amplitude');
title('Saída do filtro da mediana');