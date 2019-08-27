load freqbrk
x = freqbrk;

level = 1;
[c,l] = wavedec(x,level,'haar');

d1 = detcoef(c,l,level);
subplot(211),plot(x)
subplot(212),plot(interpft(d1,2*length(d1)));ylabel('d1')

%%

load scddvbrk;
x = scddvbrk;
level = 2;
[c,l] = wavedec(x,level,'db4');
[d1 d2] = detcoef(c,l,1:level);
subplot(311),plot(x),xlim([400 600])
subplot(312),d1up(1:2:1008)=d1;plot(d1up);ylabel('d1'),xlim([400 600])
subplot(313),d2up(1:4:1020)=d2;plot(d2up);ylabel('d2'),xlim([400 600])