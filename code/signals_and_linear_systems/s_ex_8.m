%% Federal University of Rio Grande do Norte
% Signals and Linear Systems
% Author: Danilo Pena
% Description: Discrete Fourier Transform (DFT)

clc; clear; close all;

%% (a). DFT.
N = 16;
na = 0:N-1;

xa = [0:7 0 -7:-1];

xs = [2*pi 1:7 3*pi 7:-1:1]; 
 
xsum = xa + xs;

Xa      = my_DFT(xa);
Xs      = my_DFT(xs);
Xsum = my_DFT(xsum);

figure('Name','DFT');
subplot(2,2,1);
stem(na,xa);
title('Real, x_a[n]');
axis tight;
grid on;

subplot(4,2,2);
stem(na,real(Xa),'rx');
title('\Ree\{X_a[k]\}');
axis tight;
grid on;

subplot(4,2,4);
stem(na,imag(Xa),'gx');
title('\Imm\{X_a[k]\}');
axis tight;
grid on;

subplot(2,2,3);
stem(na,xs);
title('x_s[n]');
axis tight;
grid on;

subplot(4,2,6);
stem(na,real(Xs),'rx');
title('\Ree\{X_s[k]\}');
grid on;
axis tight;

subplot(4,2,8);
stem(na,imag(Xs),'gx');
title('\Imm\{X_s[k]\}');
grid on;
axis tight;

%% (b). DFT{xa[n] + xs[n]}.
np4 = 0:31;
xr = [];
xr = upsample(xa,2);

Xr = my_DFT(xr);

figure('Name','DFT');
subplot(1,2,1);
stem(np4,xr);
title('x_r[n]\uparrow2');
axis tight;
grid on;

subplot(2,2,2);
stem(np4,real(Xr),'rx');
title('\Ree\{X_r[k]\}');
axis tight;
grid on;

subplot(2,2,4);
stem(np4,imag(Xr),'gx');
title('\Imm\{X_r[k]\}');
axis tight;
grid on;

%% (c).xp[n]:
% np3 = 0:11;
np4 = 0:15;
% np6 = 0:23;
np8 = 0:31;

ramp = [0 1 2 3];
% xp3 = [ramp ramp ramp];
xp4 = [ramp ramp ramp ramp];
% xp6 = [ramp ramp ramp ramp ramp ramp];
xp8 = [ramp ramp ramp ramp ramp ramp ramp ramp];

% Xp3 = my_DFT(xp4);

Xp4 = my_DFT(xp4);

% Xp6 = my_DFT(xp4);

Xp8 = my_DFT(xp8);

figure('Name','DFT');
% subplot(3,2,1);
% stem(np3,xp3);
% title('x_p_3[n]');
% axis tight;
% grid on;
% 
% subplot(6,2,2);
% stem(np3,real(Xp3),'r*');
% ylabel('\Ree\{X_p_3[k]\}');
% axis tight;
% grid on;
% 
% subplot(6,2,4);
% stem(np3,imag(Xp3),'g*');
% ylabel('\Imm\{X_p_3[k]\}');
% axis tight;
% grid on;

subplot(2,2,1);
stem(np4,xp4);
title('x_p_4[n]');
axis tight;
grid on;

subplot(4,2,2);
stem(np4,real(Xp4),'r*');
ylabel('\Ree\{X_p_4[k]\}');
axis tight;
grid on;

subplot(4,2,4);
stem(np4,imag(Xp4),'g*');
ylabel('\Imm\{X_p_4[k]\}');
axis tight;
grid on;

subplot(2,2,3);
stem(np8,xp8);
title('x_p_8[n]');
axis tight;
grid on;

subplot(4,2,6);
stem(np8,real(Xp8),'r*');
ylabel('\Ree\{X_p_8[k]\}');
axis tight;
grid on;

subplot(4,2,8);
stem(np8,imag(Xp8),'g*');
ylabel('\Imm\{X_p_8[k]\}');
axis tight;
grid on;

%% (d). x[n]:
x = cos(5*pi/8*na);

X = my_DFT(x);

figure('Name','DFT');
subplot(1,2,1);
stem(na,x);
title('x[n] = cos(5\pin/8)');
axis tight;
grid on;

subplot(2,2,2);
stem(na,real(X),'rx');
title('\Ree\{X[k]\}');
axis tight;
grid on;

subplot(2,2,4);
stem(na,imag(X),'gx');
title('\Imm\{X[k]\}');
axis tight;
grid on;