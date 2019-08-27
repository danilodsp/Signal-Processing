n = 1e-1;
T = 10;
%t = -pi:n:pi;
t = -T/2:n:(T/2)-n;

%x = square(t+pi/2,50);
x = abs(t)<2.5;
f = fft(x);
ta = 1/n;
N = length(t);

w = (-1/(2*n)):(1/T):(1/(2*n))-(1/T);

plot(t,x)
stem(w,abs(f))