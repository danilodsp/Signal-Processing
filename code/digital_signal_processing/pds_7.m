%% Federal University of Rio Grande do Norte
% Digital Signal Processing - Communications Engineering Department (DCO)
% Author: Danilo Pena
% Description: analysis of frequency response with zeros and poles

clear
clc
close all

% Exemplo de simples zero
%zz = [0.8*exp(j*pi*0.3)].';
%pp = [].';
%ymax = 2;

% Exemplo de simples polo
%pp = [0.9*exp(j*pi*0.3)].';
%zz = [].';
%ymax = 10;

% exemplo dois polos, dois zeros
zz = [0.8*exp(j*pi*0.3) 0.8*exp(j*pi*-0.3)].';
pp = [0.9*exp(j*pi*0.3) 0.9*exp(j*pi*-0.3)].';
ymax = 2;

bb = poly(zz);
aa = poly(pp);

% passos em torno da metade do c�rculo unit�rio
ww = [0:200]/200*pi;

subplot(121);
zplane(pp,zz);

subplot(222)
fax = [0 1 0 ymax];
axis(fax)
grid

subplot(224)
pax = [0 1 -1 1];
axis(pax);
grid

GG = polyval(bb,exp(j*ww))./polyval(aa,exp(j*ww));
HH = abs(GG);
PP = angle(GG);

% plota os frames
for i = 1:length(ww);

  w = ww(i);
  z = exp(j*w);

  % calcula a transformada z neste ponto
  Gz = polyval(bb,z)./polyval(aa,z);
  
  HH(i) = abs(Gz);
  PP(i) = angle(Gz);
  
  % plots
  subplot(121)
  zplane([0],[]);
  hold on
  plot(real(z),imag(z),'sg');
  
  % adiciona os par�metros omegas no plot
  for www = -0.8:0.2:0.8
    ejw = exp(j*www*pi);
    ll = sprintf('%.1f\\pi',www);
    text(real(ejw), imag(ejw), ll);
  end
  
  % Plota as linhas conectando os polos e zeros
  for r = pp.'
	plot(real(r),imag(r), 'xr');
	plot([real(r), real(z)], [imag(r), imag(z)], '-r');
  end
  for r = zz.'
	plot(real(r),imag(r), 'ob');
	plot([real(r), real(z)], [imag(r), imag(z)], '-g');
  end
  hold off
  
  subplot(222)
  plot(ww/pi, HH, w/pi, HH(i), 'sg',[w/pi w/pi], [0 HH(i)], '-g');
  axis(fax)
  grid
  title('magnitude');

  subplot(224)
  plot(ww/pi, PP/pi, w/pi, PP(i)/pi, 'sg');
  axis(pax)
  grid
  title('fase');
  xlabel('\omega / \pi');
  set(gca, 'YTick', [-1 -0.5 0 0.5 1])
  set(gca, 'YTickLabel', [' -pi ';'-pi/2';'  0  ';' pi/2'; '  pi '])


  drawnow

%  if (w > 0.28*pi)
%    break
%  end

end
