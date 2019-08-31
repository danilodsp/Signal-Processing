% analytical distribution

clear all;
clc;

f= 100000;
l = 1;

% An(i) = l* exp(-x(i)*l);

% exponential distribution

u = rand(1,f);   
ui= -(1/l).*log(u*l);

hist(ui,200); 
title('Exponential Distribution')
grid on

