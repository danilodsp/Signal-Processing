clear,clc;

H=[0 1 0;1 -4 1;0 1 0];
%H=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];
X = imread('lena.png');
y = X;
[l,c]=size(X);
[i,j]=size(H);
u=zeros(l+3);

for m=1:l
 for n=1:c
     aux(m,n)=0;
  for i1= 1:i
    for j1 = 1:j
      
       if ((m+i1<=l)&&(n+j1<=c))%utilizado para não ultrapassar o tamanho da matriz
          aux(m,n)= double(X(m+i1-1,n+j1-1))*H(i1,j1) + aux(m,n);
          y(m,n)= aux(m,n);
       end
     
       
  end
  end
 end
end

imshow(y)
