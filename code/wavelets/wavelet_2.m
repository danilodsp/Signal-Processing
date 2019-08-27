
%wavelet 2
clc
clear all

%load leleccum
%s = leleccum(1:3920);

% teste com outra função
passo=0.01;
fim=5;
i=1;
for x=0:passo:fim
s(i)=sin(cos(x))-cos(x*3)/3+1;
i=i+1;
end

l_s = length(s);
[cA1,cD1] = dwt(s,'db1');


A1 = upcoef('a',cA1,'db1',1,l_s); 
D1 = upcoef('d',cD1,'db1',1,l_s);

% %ou
% A1 = idwt(cA1,[],'db1',l_s); 
% D1 = idwt([],cD1,'db1',l_s);
figure
subplot(1,2,1); plot(A1); title('Approximation A1')
subplot(1,2,2); plot(D1); title('Detail D1')

A0 = idwt(cA1,cD1,'db1',l_s);
err = max(abs(s-A0))

[C,L] = wavedec(s,3,'db1');
cA3 = appcoef(C,L,'db1',3);

cD3 = detcoef(C,L,3); 
cD2 = detcoef(C,L,2); 
cD1 = detcoef(C,L,1);

% % ou
%[cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
A3 = wrcoef('a',C,L,'db1',3);
D1 = wrcoef('d',C,L,'db1',1);
D2 = wrcoef('d',C,L,'db1',2);
D3 = wrcoef('d',C,L,'db1',3);
figure
subplot(2,2,1); plot(A3); 
title('Approximation A3')
subplot(2,2,2); plot(D1); 
title('Detail D1')
subplot(2,2,3); plot(D2); 
title('Detail D2')
subplot(2,2,4); plot(D3); 
title('Detail D3')

A0 = waverec(C,L,'db1');

err = max(abs(s-A0))

figure
subplot(2,1,1);plot(s);title('Original'); 
subplot(2,1,2);plot(A3);title('Level 3 Approximation');


figure
subplot(3,1,1); plot(D1); title('Detail Level 1'); axis off
subplot(3,1,2); plot(D2); title('Detail Level 2'); axis off
subplot(3,1,3); plot(D3); title('Detail Level 3'); axis off

[thr,sorh,keepapp] = ddencmp('den','wv',s);
clean = wdencmp('gbl',C,L,'db1',3,thr,sorh,keepapp);

% figure
% subplot(2,1,1); plot(s(2000:3920)); title('Original')
% subplot(2,1,2); plot(clean(2000:3920)); title('De-noised')



