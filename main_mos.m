clc;
clear;
close all;

img1=imread('Img/immeuble.png');
%img1=imread('Img/coronair.tif')
img2=imread('Img/publicite1.jpg');

Y1=[1       1      size(img2,1) size(img2,1)];
X1=[1 size(img2,2) size(img2,2)     1       ];
figure,
imshow(img1)
[X2,Y2]=ginput(4);

[I3,M3,B3]=creation_mosaique(img1,img2,X1,Y1,X2,Y2);

imshow(I3);