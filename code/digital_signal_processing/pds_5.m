% Verificando a diferença entre convolucao_circular e cc_tdf

x = rand(1,10);
h = rand(1,10);

y1 = convolucao_circular(h,x);
y2 = cc_tdf(h,x);

err = y1 - y2;

max(abs(err))