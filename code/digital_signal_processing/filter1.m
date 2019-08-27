%%
% Iniciando comunicacao serial

clear

s = serial('COM3','BaudRate',9600,'InputBufferSize',8*1024,'OutputBufferSize',8*1024,'Timeout',10);
fopen(s);

%%
% Construcao do sinal

u = [zeros(1,50) ones(1,50)];
ruido = 0.1*randn(1,100);

sinal = u + ruido;

%%
% Enviando e recebendo o sinal

%fprintf(s,'oi');
%r = fscanf(s)

clear R
fwrite(s,sinal,'float');
R = fread(s,100,'float');
%R = fscanf(s,'%d');

%fwrite(s,num2str(sinal,'%f '),'char');
%fwrite(s,'!','char');
%R = fread(s,[1,1000],'char');
%num = char(R);
%num = str2num(num');

%plot(R)

yn = zeros(1,100);
for i=1:100
    if i>4
        yn(i) = 0;
        for j=1:4
            yn(i) = yn(i) + sinal(i-j + 1)*(1/4);
        end
    end
end


%%
% Finalizando comunicacao

fclose(s)
delete(s)
clear s