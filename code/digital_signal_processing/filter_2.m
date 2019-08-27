%% Federal University of Rio Grande do Norte
% Digital Signal Processing
% Author: Danilo Pena
% Description: Zeros-poles analysis

% Definindo um par de polos conjugados
z0 = .9*exp(j*.1*pi);

a = poly([z0 z0'])

b = fliplr(a);

freqz(b,a)

zplane(b,a)

grpdelay(b,a)


vizZTsurf(b,a)

recObj = audiorecorder
recordblocking(recObj, 5);
sr = getaudiodata(recObj);
x = length(sr);

y = sr;
for i = 1:100; y = filter(b,a,y); end
sound(sr)
sound(y)


subplot(211)
plotspec(sr,x,16384);

subplot(212)
plotspec(y,x,16384);
% espectogramas
subplot(211)
specgram(sr,512,x)
subplot(212)
specgram(y,512,x)