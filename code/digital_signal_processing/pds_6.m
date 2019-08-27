%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: frequency response

% filtro da m�dia m�vel de 5 pontos
h = 1/5*ones(1,5);

% tempo
nn = -20:100;
% offset para o ponto zero
zz = 21;
% soma de dois senos de igual amplitude com 0.1pi rad/samp e 0.5pi rad/samp
s1(zz+[0:100]) = sin(0.1*pi*[0:100]);
s2(zz+[0:100]) = sin(0.5*pi*[0:100]);
x = s1 + s2;

% passa pelo filtro
y = conv(h,x);
% trunca y pra ter a mesma largura de x
y = y(1:length(x));

% plota resultados
subplot(411)
% as duas componentes
plot(nn,s1,nn,s2)
% sua soma (entrada do sistema) e sa�da do sistema
subplot(412)
plot(nn,x,nn,y);
grid
axis([-20 100 -2 2])

% comparando as senoides escaladas por suas respostas na frequ�ncia
H = fft(h,256);
% com fft de 256pts, 2pi corresponde a 256, logo 0.1pi corresponde a 256/20
H1 = H(1+round(0.1*(256/2)));
H2 = H(1+round(0.5*(256/2)));
% senoides individuais escaladas e deslocadas de fase pelas amostras de
% resposta em frequ�ncia
s1b(zz+[0:100]) = abs(H1)*sin(0.1*pi*[0:100]+angle(H1));
s2b(zz+[0:100]) = abs(H2)*sin(0.5*pi*[0:100]+angle(H2));
% plota as senoides modificadas
subplot(413)
plot(nn,s1b,nn,s2b)
% .. e compara com sua soma da atual saida do sistema
subplot(414)
plot(nn,s1b+s2b,nn,y)
grid
axis([-20 100 -2 2])