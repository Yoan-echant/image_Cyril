function [imgf,nM,Bf]=hom_triplet(img,M,B,hmat)
    Bf=calcul_fenetre(h,B);
    disp(Bf);
    disp(Bf(1,2));
    [imgf,nM]=application_homographie(img,hmat,Bf,M);