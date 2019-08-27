% Aliasing em Downsampling

clc; clear; close all;

%% Sinal
samples = 5*360;  % 360 é multiplo de 4,18,20,24
n = 0:samples - 1;
w0 = pi/11;
x = cos(w0*n);

%% Desenvolvendo downsampling com fatores N = 4, 18, 20 and 24
N = [4 18 20 24];
y = cell(1,4);
Y = cell(1,4);

for i=1:4
     y{i} = downsample(x,N(i));
end

%% Calcula a DTFT dos sinais x e y
[w  X] = my_DTFT(x,n);

%% Plota as magnitudes DTFT de x e y 
figure('Name','Aliasing em Downsampling');
subplot(5,2,1);
stem(n, x,'b.');
title('x[n] = cos(\pin/11)');
axis tight;
grid on;

subplot(5,2,2);
plot(w,abs(X),'r');
hold on;
title('\omega_0 = \pi/11');
set(gca,'XTick',-pi:pi/4:pi);
set(gca,'XTickLabel',{'-pi','-3*pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' });
% xlabel('\omega (rad/sample)');
ylabel('|X(j\omega)|');
axis tight;
grid on;

freq_shift = ['4\pi/11       '; '\pi + 7\pi/11 '; '\pi + 9\pi/11 '; '2\pi + 2\pi/11';];

for i=1:4

    n2 = 0:length(y{i})-1;
    [w Y{i}] = my_DTFT(y{i},n2);

    subplot(5,2,2*i+1);
    stem(n2, y{i},'g.');
    title(['y_',num2str(i),'[n]  = x[n] \downarrow ',num2str(N(i))]);
    axis tight;
    grid on;

    subplot(5,2,2*i+2);
    plot(w,abs(Y{i}),'r');
    ylabel(['|Y_',num2str(i),'(j\omega)|']);
    hold on;
    
    if N(i)*w0>pi
        
       title(['\omega_0*N = ',num2str(N(i)*w0),' = ',freq_shift(i,:),'> \pi (Aliasing)']);
       line([-2*pi+w0*N(i) -2*pi+w0*N(i)], [0 max(abs(Y{i}))]);
       line([ 2*pi-w0*N(i)   2*pi-w0*N(i) ], [0 max(abs(Y{i}))]);
    else
        title(['\omega_0*N = ',num2str(N(i)*w0),' = ',freq_shift(i,:),'< \pi']);
        line([-w0*N(i) -w0*N(i)], [0 max(abs(Y{i}))]);
        line([ w0*N(i)   w0*N(i) ], [0 max(abs(Y{i}))]);
    end
    set(gca,'XTick',-pi:pi/4:pi);
    set(gca,'XTickLabel',{'-pi','-3*pi/4','-pi/2','-pi/4','0','pi/4','pi/2','3pi/4','pi' });
    % xlabel('\omega (rad/sample)');
    axis tight;
    grid on;

end