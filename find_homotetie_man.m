function [h]=find_homotetie_man(img1,img2)
    figure;
    subplot(1,2,1)
    imshow(img1)
    [X1,Y1]=ginput(4);
    subplot(1,2,2)
    imshow(img2)
    [X2,Y2]=ginput(4);

    A=[X1 Y1];
    B=[X2 Y2];
    disp('taille matrice')
    disp(size(A))
    h=(transpose(A)*A)^(-1)*transpose(A)*B;
    
end

