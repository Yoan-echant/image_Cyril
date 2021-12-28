function [I3,M3,B3]=creation_mosaique(img1,img2,X1,Y1,X2,Y2)
% on suppose qu'on veut utiliser img1 comme image de reference : 
[img, M1, B1]=creation_triplet(img1);
[img2, M2, B2]=creation_triplet(img2);
% homographie de img2 vers img1 avec X1,Y1 correspondant aux extremités de
% l'image 
h=find_homographie_man(X2,Y2,X1,Y1);
% passage de l'image 2 vers la base de  l'image 1 : 
[img2, M2, B2]=application_homographie(img2,M2,B2,h);
% fusion :
[I3,M3,B3]=fusion(img,M1,B1,img2,M2,B2);



end