clear
close all
clc

%% Iniciando comunicação serial
    
s = serial('COM16','BaudRate',115200,'InputBufferSize',8*262144,'OutputBufferSize',8*262144,'Timeout',3);
fopen(s);

nSamples = 20000;

%fwrite(s,bytes,'float');
x = fread(s,nSamples,'char');

fclose(s);
delete(s)
clear s

%% Dados

x0 = x(1:8:length(x));
x1 = x(2:8:length(x));
x2 = x(3:8:length(x));
x3 = x(4:8:length(x));
x4 = x(5:8:length(x));
x5 = x(6:8:length(x));
x6 = x(7:8:length(x));
x7 = x(8:8:length(x));

plot(x0)
hold on
plot(x1,'r')
plot(x2,'g')
plot(x3,'k')
plot(x4,'y')
plot(x5,'m')
plot(x6,'k')
plot(x7,'g')

E(1) = sum((x0-x1).^2);
E(2) = sum((x0-x2).^2);
E(3) = sum((x0-x3).^2);
E(4) = sum((x0-x4).^2);
E(5) = sum((x0-x5).^2);
E(6) = sum((x0-x6).^2);
E(7) = sum((x0-x7).^2);

y0 = y(1:8:length(y));
y1 = y(2:8:length(y));
y2 = y(3:8:length(y));
y3 = y(4:8:length(y));
y4 = y(5:8:length(y));
y5 = y(6:8:length(y));
y6 = y(7:8:length(y));
y7 = y(8:8:length(y));

figure
plot(y0)
hold on
plot(y1,'r')
plot(y2,'g')
plot(y3,'k')
plot(y4,'y')
plot(y5,'m')
plot(y6,'k')
plot(y7,'g')

% y - adc igual; z - adc diferente;
