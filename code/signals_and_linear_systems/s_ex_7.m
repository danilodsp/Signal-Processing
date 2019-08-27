%% Federal University of Rio Grande do Norte
% Signals and Linear Systems
% Author: Danilo Pena
% Description: Convolution

clc; clear; close all;

%% Sinais.
n = -7:7; % sinal ee come�a em n=-7.
ee = [  3.263941e-5  -6.037312e-4  2.971067e-3  -9.563761e-3  2.457258e-2  -5.702938e-2  1.466156e-1  0 ... 
          -1.466156e-1    5.702938e-2 -2.457258e-2   9.563761e-3 -2.971067e-3   6.037312e-4   -3.263941e-5 ];

n1 = 0:8; % sinal ff come�a em n=0.
ff = [0.029515 0.08774473 0.1672274 0.2398594 0.2715347 0.2398594 0.1672274 0.08774473 0.029515];

%% (a). EE(w), FF(w) e EE(w)*FF(w)

% DTFT aproximada de ee[n]:
[w EE] = my_DTFT(ee,n);

% EE(w):
figure('Name','Convolu��o');
subplot(4,2,1);
plot(w,abs(EE));
title(['|EE(j\omega)|']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(4,2,2);
plot(w,unwrap(angle(EE)),'r');
title(['{\angle}EE(j\omega)']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
xlim([-pi pi]);
grid on;

% FF(w):
[w FF] = my_DTFT(ff,n1);

% Plot de FF(w):
subplot(4,2,3);
plot(w,abs(FF),'b');
title(['|FF(j\omega)|']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(4,2,4);
plot(w,unwrap(angle(FF)),'r');
title(['{\angle}FF(j\omega)']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

% Produto de EE(w)*FF(w):
EEFF = EE.*FF;

subplot(4,2,5);
plot(w,abs(EEFF));
title(['|EE(j\omega)*FF(j\omega)|']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(4,2,6);
plot(w,unwrap(angle(EEFF)),'r');
title(['{\angle}EE(j\omega)*FF(j\omega)']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
% xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(4,2,7);
plot(w,real(EEFF));
title(['\Ree\{EE(j\omega)*FF(j\omega)\}']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(4,2,8);
plot(w,imag(EEFF),'r');
title(['\Imm\{EE(j\omega)*FF(j\omega)\}']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

%% (b). Convolu��o do sinal y[n] = ee[n]*ff[n].

y = conv(ee,ff); % Tamanho n+m-1 = 23.
                           % Este sinal dura de n=-7 to n=15.

% C�lculo aproximado de FF(w):
n2 = -7:15;
[w Y] = my_DTFT(y,n2);

% Plot Y(w):
figure('Name','Convolu��o');
subplot(2,2,1);
plot(w,abs(Y));
title(['|Y(j\omega)| = |DTFT\{ee[n]\astff[n]\}|']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(2,2,2);
plot(w,angle(Y),'r');
title(['{\angle}Y(j\omega)']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(2,2,3);
plot(w,real(Y));
title(['\Ree\{Y(j\omega)\}']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;

subplot(2,2,4);
plot(w,imag(Y),'r');
title(['\Imm\{Y(j\omega)\}']);
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' })
xlabel('\omega (rad/amostras)');
axis tight;
xlim([-pi pi]);
grid on;