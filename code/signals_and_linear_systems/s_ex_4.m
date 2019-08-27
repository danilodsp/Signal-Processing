%% Federal University of Rio Grande do Norte
% Signals and Linear Systems
% Author: Danilo Pena
% Description: Discrete Time Fourier Transform (DTFT)

clc; clear; close all;

%% (a). Calculando a DTFT de sinais finitos:
n1 = 0:63;
n2 = n1;
n3 = 0:31;

x1 = sin(pi*n1/8);
x2 = cos(pi*n1/8);
x3 = ones(32,1);  

n4 = -20:20;
x4 = [sin(pi.*(-20:-1)/2)./(pi*(-20:-1)) 1/2 sin(pi.*(1:20)/2)./(pi.*(1:20))];

n5 = -32:31;
basic_blk = [1 1 1 1 0 0 0 0];
x5 = [basic_blk basic_blk basic_blk basic_blk basic_blk basic_blk basic_blk basic_blk];

n6 = -32:31;
basic_blk2 = [1 0 0 0 0 0 0 0];
x6 = [basic_blk2 basic_blk2 basic_blk2 basic_blk2 basic_blk2 basic_blk2 basic_blk2 basic_blk2];

%% (c).  Calculando a parte real e imagin�ria de X(w).

% C�lculo aproximado da DTFT de x[n]:
[w X1] = my_DTFT(x1,n1);

[w X2] = my_DTFT(x2,n2);

[w X3] = my_DTFT(x3,n3);

[w X4] = my_DTFT(x4,n4);

[w X5] = my_DTFT(x5,n5);

[w X6] = my_DTFT(x6,n6);

%% Plotando magnitude da DTFT de todos os sinais..
figure('Name','Transformada de Fourier de Tempo Discreto (DTFT)');
subplot(3,2,1);
stem(n1,x1,'b.');
title(['{\itx_1}[n] = sin(\pin/8)*\{u[n]-u[n-64]\}']);
axis tight;
grid on;

subplot(3,2,2);
plot(w,abs(X1),'r');
ylabel('|{\itX_1}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;

subplot(3,2,3);
stem(n2,x2,'b.');
title(['{\itx_2}[n] = cos(\pin/8)*\{u[n]-u[n-64]\}']);
axis tight;
grid on;

subplot(3,2,4);
plot(w,abs(X2),'r');
ylabel('|{\itX_2}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;

subplot(3,2,5);
stem(n3,x3,'b.');
title(['{\itx_3}[n] = u[n]-u[n-32]']);
axis tight;
grid on;

subplot(3,2,6);
plot(w,abs(X3),'r');
ylabel('|{\itX_3}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;

%% Figure 2.
figure('Name','Transformada de Fourier de Tempo Discreto (DTFT)');
subplot(3,2,1);
n4 = -20:20;
stem(n4,x4,'b.');
title(['{\itx_4}[n] = \{sin(\pin/2)/(\pin)\}\{u[n+20]-u[n-21]\}']);
axis tight;
grid on;

subplot(3,2,2);
plot(w,abs(X4),'r');
ylabel('|{\itX_4}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;

subplot(3,2,3);
n5 = -32:31;
stem(n5,x5,'b.');
title(['{\itx_5}[n]: 64-pontos onda quadrada com per�odo 8']);
axis tight;
grid on;

subplot(3,2,4);
plot(w,abs(X5),'r');
ylabel('|{\itX_5}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;

subplot(3,2,5);
n6 = -32:31;
stem(n6,x6,'b.');
title(['{\itx_6}[n]: 64-pontos trem de impulsos com per�odo 8']);
axis tight;
grid on;

subplot(3,2,6);
plot(w,abs(X6),'r');
ylabel('|{\itX_6}(j\omega)|');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostra)');
xlim([-pi pi]);
axis tight;
grid on;
