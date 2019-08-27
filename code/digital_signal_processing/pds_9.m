%% Federal University of Rio Grande do Norte
% Digital Signal Processing
% Author: Danilo Pena
% Description: IIR Filter - IIR filter design exercise

% As especifica��es s�o -1 dB @ 1 kHz, -40 dB @ 5 kHz
% ent�o 20*log10(1/sqrt(1+e^2)) =  -1 , logo e^2 = 
e2 = ((1/(10^(-1/20)))^2)-1
%e2 =
%     0.2589

% e 20*log10(1/A) = -40, ent�o A = 
A = 10^(40/20)
%A = 
%    100

% Ent�o a ordem deve ser no m�nimo
0.5*log10((A*A-1)/e2)/log10(5000*2*pi/(1000*2*pi))
%ans =
%    3.2811

% Considerando que N deve ser um inteiro >= 3.28, fazemos
N = 4;

% Se 10*log10( 1/(1+(W/Wc)^2N) ) = -1 dB em W = 2pi*1 kHz , qual � o Wc?
Wc = 2*pi*1000/((1/(10^(-1/10)) - 1)^(1/(2*N)))
%Wc =
%   7.4393e+03
% Qual o valor em Hz (em vez de rad/s)?
Wc/2/pi
%ans =
%   1.1840e+03
% .. mesmo da tabela

% Ent�o agora projetamos o filtro
[B,A] = butter(N,Wc,'s');
% Plot sua resposta em log-log
freqs(B,A)
% .. ou amostra em uma frequ�ncia linear especifica de 0 � 10 kHz
W = [0:10:10000]*2*pi;
[h,w] = freqs(B,A,W);
subplot(111)
% Plot o ganho em dB novamente com frequ�ncia em Hz
plot(W/2/pi, 20*log10(abs(h)))
grid
% Zoom para confirmar que -1 dB @ 1 kHz, 
% bem abaixo de -40 dB @ 5kHz porque a ordem utilizada foi maior que
% a necess�ria para o projeto.