n = -100:99;

x = [zeros(1,100) ones(1,100)];
h = [zeros(1,100) ones(1,100)];
%xt = [zeros(1,100) x zeros(1,100)];
ht = [zeros(1,100) fliplr(h) zeros(1,100)];
nt = -200:199;

y = zeros(1,200);
N = length(n);

for m=1:N-1
    for k=1:N-1
        y(m) = y(m) + (x(k) * ht(m + k)); 
    end
end