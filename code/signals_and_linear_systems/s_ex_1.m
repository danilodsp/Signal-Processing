%% Federal University of Rio Grande do Norte
% Signals and Linear Systems
% Author: Danilo Pena
% Description: Introduction to Signals and Linear Systems

clc; clear; close all;

%% Create a basic signal of length 16
N = 16;
n = 0:N-1;

b = ones(1,N);          % ones block.
r = n;                  % ramp.

P = 8;                  % Triangular signal period.
n1 = 0:P/2-1;
n2 = P/2:P-1;
P1 = P*ones(1,length(n2));
A = 1;

tri_block = [2*A*n1/P 2*A*(P1-n2)/P]  ; 
t = [tri_block tri_block];      % Triangular signal periodic.

e = (5/6).^n; % Exponencial de um lado.

%% a. Criando e plotando d[n] = r[n-6]*u[n].
figure('Name','Sinais elementares');
subplot(3,1,1);
stem(n,r);
grid;
hold on;
stem(n+6,r,'r*');
title('r[n] (blue) and d[n]=r[n-6]*u[n] (red)');

%% b. Criando e plotando a[n]=b[n]-b[n-6].
a = [b(1:6) zeros(1,10)];
subplot(3,1,2);
stem(n,b);
grid;
hold on;    
stem(n,a,'r*');
title('b[n] (blue) and a[n]=b[n]-b[n-6] (red)');

%% c. Criando e plotando y[n]=e[n+10]*b[n].

y = [e(11:16) zeros(1,10)].*b;
subplot(3,1,3);
stem(n,e);
grid;
hold on;
stem(n-10,e,'r*');
stem(n,y,'g');
title('e[n] (blue), e[n+10] (red) and y[n]=e[n+10]*b[n] (green)');

%% d. Criando e plotando z[n]=t[n]*(u[n]-u[n-10]).
z = [t(1:10) zeros(1,6);];

figure('Name','Exercise 2.1.3. Elementary Signals');
subplot(3,1,1);
stem(n,t);
grid;
hold on;
stem(n,z,'r*');
title('t[n] (blue) and z[n]=t[n]*(u[n]-u[n-10]) (red)');

%% e. Criando e plotando e_e[n]=even{e[n]}*(u[n+5]-u[n-5]).

m = -N+1:N-1; % A dura��o do sinal � 2*(N-1) + 1.

e_ext = [ zeros(1,N-1) e];

% figure(3);
% stem(m,e_ext);
% grid on;

e_even = (e_ext + fliplr(e_ext))/2;
e_odd   = (e_ext - fliplr(e_ext))/2;

subplot(3,1,2);
stem(m,e_even);
grid;
hold on;
stem(-5:4,e_even(11:20),'r*');
title('e_e_v_e_n[n] (blue) and e_e[n]=e_e_v_e_n[n]*(u[n+5]-u[n-5]) (red)');

%% f. Criando e plotando e_o[n]=odd{e[n]}*(u[n+5]-u[n-5]).

subplot(3,1,3);
stem(m,e_odd);
grid;
hold on;
stem(-5:4,e_odd(11:20),'r*');
title('e_o_d_d[n] (blue) and e_o[n]=e_o_d_d[n]*(u[n+5]-u[n-5]) (red)');


