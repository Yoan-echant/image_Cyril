clc;
clear;
close all;

img1=imread('cameraman.tif');
img2=imread('centrale.tif');
[h,X,Y]=find_homotetie_man(img2,img1);
[imgtransforme,mask]=application_homographie(img1,h);

<<<<<<< HEAD
[h]=find_homotetie_man(img2,img1);

mosaique=create_mos(img1,img2,h);
figure;
imshow(mosaique);
=======
% nouvelle image homographie 
figure;
imshow(uint8(imgtransforme));
figure;
imagesc(mask);

% supoerposition image :

[w,h,z ]=size(mask);
for k=1:w
    for i=1:h
        if (mask(k,i)==1)
            img2(k,i)=imgtransforme(k,i);
        end
    end
end

figure;
imshow(img2);
title("image superposée");

%mosaique=create_mos(img1,newim,h);

%imagesc(mosaique);

% faire l'homographie de l'image, calculer l'homographie des 4 points
% extrêmes, regarder min et max de chaque extremités pour avoir la taille
% de la nouvelle image 
% attention les coordonnées sont négatives
>>>>>>> e1e3b0ed689dfe981dd7e5416dab17a7779687ae
