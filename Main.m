clc;
clear;
close all;

img1=imread('Img/immeuble.png');
%img1=imread('Img/coronair.tif')
img2=imread('Img/publicite1.jpg');
[h]=find_homotetie_man(img2,img1);
[imgtransforme,mask]=application_homographie2(img2,h,img1);

%[h]=find_homotetie_man(img2,img1);

%mosaique=create_mos(img1,img2,h);
%figure;
%imshow(mosaique);

% nouvelle image homographie 
figure;
imshow(uint8(imgtransforme));
figure;
imagesc(mask);

% supoerposition image :
%{
[w,h,z ]=size(mask);

for k=1:w
    for i=1:h
        if (mask(k,i)==1)
            img1(k,i)=imgtransforme(k,i);
        end
    end
end

figure;
imshow(img1);
title("image superposée");
%}
%mosaique=create_mos(img1,newim,h);

%imagesc(mosaique);

% faire l'homographie de l'image, calculer l'homographie des 4 points
% extrêmes, regarder min et max de chaque extremités pour avoir la taille
% de la nouvelle image 
% attention les coordonnées sont négatives

