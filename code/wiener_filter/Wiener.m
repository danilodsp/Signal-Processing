clear
m=10;
n = 10000;
ts = 0.002;%periodo de amostragem
%filtro para gerar x com banda limitada
% x0 = 1*randn(1,n);
% g = tf(1,[0.1 1]);
% gd = c2d(g,ts);
t = 0:ts:(n-1)*ts;
%x = (lsim(gd,x0,t))';
x = sin(50*pi*t/max(t));    %Sinal senoidal
 
N = 2*randn(1,n);
h1 = tf(0.2, [1 0.8], ts)
Nf = lsim(h1,N,t);
y = x + Nf';    % sinal + ruido

% FIRWIENER (MATLAB)
bw = firwiener(n-1,y',x'); %coeficientes do filtro
B=filter(bw,[1],y);

%Filto de Wiener calculando as matrizes
y=y';
x=x';
[ntr,L] = size(y);
r = zeros(2*n-1,1);             
p = r;                          
for k=1:L
    r = r + xcorr(y(:,k),n-1);          %Autocorrela��o
    p = p +  xcorr(x(:,k),y(:,k),n-1);  %Correla��o Cruzada
end
R = toeplitz(r(n:2*n-1))/(L*ntr);  %Diagonaliza��o de R
P = p(n:2*n-1).'/(L*ntr);          %Normaliza��o de P 
W = P/R;                           %Par�metros do filtro
Z=filter(W,[1],y);                 %Sa�da do filtro

figure (1)
subplot (4,1,1)
plot (t,x)
title('x')
subplot (4,1,2)
plot (t,y)
title('x+N')
subplot (4,1,3)
plot (t,B)
title ('Filtro Matlab')
subplot (4,1,4)
plot (t,Z)
title('Filtro calculado')

figure (2)
Yfft = fft(y); %Sinal com ru�do no dom�nio da frequ�ncia
Zfft = fft(Z); %Sa�da do filtro no dom�nio da frequ�ncia
plot(abs(Yfft))
hold on
plot(abs(Zfft),'r')