%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: check the difference between circular convolution and cc_dft

x = rand(1,10);
h = rand(1,10);

y1 = convolucao_circular(h,x);
y2 = cc_tdf(h,x);

err = y1 - y2;

max(abs(err))