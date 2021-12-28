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



[h]=find_homographie_man(X1,Y1,X2,Y2);
[imgtransforme,mask]=application_homographie2(img2,h,img1);

% nouvelle image homographie 
figure;
imshow(uint8(imgtransforme));title("projection");
figure;
imagesc(mask);
title("projection");

% extraction image : 
Y1=[1       1      255 255];
X1=[1 255 255     1];
img=zeros(255,255,3);
figure,
imshow(img1)
[X2,Y2]=ginput(4);
[hbis]=find_homographie_man(X2,Y2,X1,Y1);
[imgtransformebis,maskbis]=application_homographie2(img1,hbis,img);

figure;
imshow(uint8(imgtransformebis));
figure;
imagesc(maskbis);
title("extraction");

% creation mosaique : 
% exemple pour trois image : 
% imageref=img1 : 

img1=zeros(256,256,3);
img2=zeros(256,256,3);
img3=zeros(256,256,3);
[I, M, B]=creation_triplet(img1);
% on créer une matrice contenant les coordonnées de chaque points
nombreimage=3;
coordonneesx=zeros(4,nombreimage);
coordonnesy=zeros(4,nombreimage);
coordonnesx(:,1)=[1 1 size(img,1) size(img,1)]';
coordonnesy(:,1)=[1 size(img,2) size(img,2) 1 ]';



for k=2:nombreimage
    for i=
    
%     figure,
%     imshow(img1)
%     [X2,Y2]=ginput(4);
%     coordonnesx(:,1)=X2';
%     coordonnesy(:,1)=Y2';
%     [I,M,B]=creation_mosaique(img1,img2,X1,Y1,X2,Y2)
end


% faire l'homographie de l'image, calculer l'homographie des 4 points
% extrêmes, regarder min et max de chaque extremités pour avoir la taille
% de la nouvelle image 
% attention les coordonnées sont négatives

% fonction 1 : estimation homographie + projection + extraction
% fonction 2 : triplet I,M,B (hauteur largueur)
% fonction 3 : Application homographie à un triplet
% fonction 4 : fusion, diviser I3 par le masque, sommer I1 et I2 

% Il faut calculer les matrices d'homographies entre chaque image, il faut
% choisir un univers d'arrivée ensuite. 
% il faut ramener l'univers de la photo 2 vers la photo 1 si on suppose que
% l'univers de départ est 1
% On fait donc H12-1 pour ramener 2 vers 1
% Pour ramener 3 vers 1 on fait (H23H12)-1. On applique fonction 4. On fait
% une cascade d'appel. 


