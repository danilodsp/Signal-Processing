%% Filtro FIR
% Processamento Digital de Sinais
% Danilo Pena
%
% Objetivo: Exercício da aula de projetos de filtro FIR

% Frequência de corte
wc = 0.15*pi;
% Metade da largura da janela
M = 12;
% Janela
w = hamming(2*M+1)';
% Janela FPB ideal
h = sin(wc*[-M:M])./(pi*[-M:M]).*w;
% ponto central é dividido por zero
h([M M+1 M+2])
% .. então substituimos na mão (para o valor correto)
h(M+1) = wc/pi*w(M+1);  % w(M+1) == 1.0, ponto central da janela
% resposta ao impulso
stem(h)
figure ()
subplot(211)
% .. 
% Resposta em frequência
freqz(h)

pause
% Convertendo para um filtro passa-alta:
% Precisa subtrair de um filtro unitário (um impulso)
% com a mesma fase linear (atraso)
h0 = zeros(1, 2*M+1);
h0(M+1) = 1;
freqz(h0-h);