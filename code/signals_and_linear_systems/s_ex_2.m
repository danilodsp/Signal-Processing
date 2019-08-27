%% Federal University of Rio Grande do Norte
% Signals and Linear Systems
% Author: Danilo Pena
% Description: Changing the axes

clc; clear; close all;
%% a. 

n = 0:4;
x = (3/4).^n;

figure('Name','Changing the axes');
subplot(2,1,1);
stem(n,x);
hold on;

stem(-n,x,'r*');
stem(-7-n,x,'g*');
stem(-n+15,x,'c*');
grid on;
title('x[n] (blue), x[-n] (red), x[-7-n] (green), x[-n+15] (cyan)');
xlabel('Sample n');

%% b.
x1 = downsample(x,2);
n1 = 0:length(x1)-1;
subplot(2,1,2);

stem(n1,x1,'b*');
grid on;
hold on;

stem(5-n1,x1,'g*');
title('x[2*n] (blue), x[5-2*n] (green)');
xlabel('Sample n');
