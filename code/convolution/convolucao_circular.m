function y = convolucao_circular(h,x)

N = length(x);
n = 0:N-1;
y = zeros(size(x));

for m = 0:N-1
    y = y + x(m+1)*h(mod(n-m,N)+1);
end

end