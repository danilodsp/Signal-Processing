%% Federal University of Rio Grande do Norte
% Digital Signal Processing
% Author: Danilo Pena
% Description: Demo of basic first-order filters

clear all;
clc;
close all

% Criando o sinal
recObj = audiorecorder
recordblocking(recObj, 5);
x = getaudiodata(recObj);
plot(x)
pause
soundsc(x)
pause

Fs = 8000;              % Frequ�ncia de amostragem
T = 1/Fs;               % Per�odo de amostragem
L = length(x);          % Tamanho do sinal
t = (0:L-1)*T;          % Tempo
X1 = fft(x);

P2 = abs(X1/L);
X = P2(1:L/2+1);
X(2:end-1) = 2*X(2:end-1);
f = Fs*(0:(L/2))/L;

figure,plot(f,X),title('Espectro do Sinal de Entrada'),grid; 

% Filtro PB FIR
b = [1 1];
a = [2];
[H_fir,w] = freqz(b,a,256);
figure,plot(w/pi,H_fir,'b'), grid on

% Filtro PB IIR
b = [1];
a = [1 -0.4];
[H1,w] = freqz(b,a,256);
figure,plot(w/pi,H1,'b'), grid on, hold on

b = [1];
a = [1 -0.6];
[H1,w] = freqz(b,a,256);
plot(w/pi,H1,'r')

b = [1];
a = [1 -0.9];
[H1,w] = freqz(b,a,256);
plot(w/pi,H1,'g'), legend('a=0.4','a=0.6','a=0.9')

[h1,t] = impz(b,a); % Resposta ao impulso
stem(h1), grid on, title('Resposta ao Impulso do FPB');

y = filter(b,a,x);

soundsc(y)          %wavplay(x,fs), fs = 44100, 22050, 11025, 8000.

% IIR PB primeira ordem normalizado
K = (1-0.9)/2;
b = [K*1 K*1];
a = [1 -0.9];
[H,w] = freqz(b,a,256);
plot(w/pi,H,'k'), grid on, hold on
plot(w/pi,H_fir,'b'), legend('IIR','FIR'), title('Espectro de Magnitude do FPB')

plot(w/pi,abs(H)); grid; title('Espectro de Magnitude do FPB');
plot(w/pi,angle(H)/pi); grid; title('Espectro de Fase do FPB');
plot(w/pi,20*log10(abs(H))); grid; title('Espectro de Magnitude em dB do FPB');
zplane(b,a); grid; title('Diagrama de polos e zeros do FPB');

% Filtrando
y = filter(b,a,x);
soundsc(y)

% Espectro de saida
Y=fft(y);
P2 = abs(Y/L);
Y = P2(1:L/2+1);
Y(2:end-1) = 2*Y(2:end-1);

figure,plot(f,X), grid on, hold on
plot(f,Y,'r'), legend('entrada','saida')

% IIR PA primeira ordem normalizado %%%%%%%%%%%%%%%%%
K = (1+0.9)/2;
b = [K*1 -K*1];
a = [1 -0.9];
[H,w] = freqz(b,a,256);
plot(w/pi,H,'k'), grid on, hold on, title('Espectro de Magnitude do FPA')

% Filtrando
y = filter(b,a,x);
soundsc(y)

% Espectro de saida
Y=fft(y);
P2 = abs(Y/L);
Y = P2(1:L/2+1);
Y(2:end-1) = 2*Y(2:end-1);

figure,plot(f,X), grid on, hold on
plot(f,Y,'r'), legend('entrada','saida')




