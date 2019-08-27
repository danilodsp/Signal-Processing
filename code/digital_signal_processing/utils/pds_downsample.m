function y = pds_downsample(x,M)

x = x(:).';
Lx = length(x);
y = zeros(1,ceil(Lx/M));

indices = 1:M:Lx;

y = x(indices);
