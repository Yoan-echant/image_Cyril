clc;
clear;
close all;

img1=imread('Img/');
img2=imread('Img/');

h=find_homotetie_man(img2,img1);
%newim=homotetie(img2,h);

%mosaique=create_mos(img1,newim);