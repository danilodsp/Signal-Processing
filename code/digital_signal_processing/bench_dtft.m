% This routine compares the time needed to execute various DTFT implementations. 
clc; clear; close all;

% Various sizes of input signals:
N = 2.^(3:10);
L = length(N);

time_dtft   = zeros(1,L);
time_dtft2 = zeros(1,L);
time_dtft3 = zeros(1,L);

for k=1:L
    
   x = randn(1,N(k));
   n = 0:length(x)-1;
   
    tic
    [w X1] = my_DTFT(x,n);
    time_dtft(k) = toc;
    
    tic
    [w X2] = my_DTFT2(x,n,[-pi pi]);
    time_dtft2(k) = toc;
    
    tic
    [w X3] = my_DTFT3(x,n);
    time_dtft3(k) = toc;
        
end

%% Now plot the results.
figure('Name','Benchmarking of DTFT execution');
semilogy(log2(N),time_dtft,'r*-');
hold on;
semilogy(log2(N),time_dtft2,'g*-');
semilogy(log2(N),time_dtft3,'m*-');
grid;
axis tight;
legend('my\_DTFT','my\_DTFT2','my\_DTFT3','Location','NorthWest');
title('Execution Time for Various DTFT Implementations');
xlabel('log_2(length(x))');
ylabel('Execution Time (sec)');


