% pds_ex_4

clear

I = imread('lena.png');

mask1 = (1/9).*[1 1 1; 1 1 1; 1 1 1];
mask2 = [0 1 0; 1 -4 1; 0 1 0];

y1 = imfilter(I,mask1);
y2 = imfilter(I,mask2);

figure (1)
imshow(I)

figure (2)
imshow(y1)

figure (3)
imshow(y2)