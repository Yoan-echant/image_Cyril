clc;
clear;
close all;

img1=imread('Img/monument.bmp');
img2=imread('Img/monument_ext.bmp');

h=find_homotetie_man(img2,img1);
hinv=find_homotetie(img1,img2);
newim=img2*h;
mosaique=create_mos(img1,newim,hinv);

imagesc(mosaique);