function [h]=find_homotetie_man(img1,img2)
    figure;
    subplot(1,2,1)
    imshow(img1)
    [X1,Y1]=ginput(4);
    subplot(1,2,2)
    imshow(img2)
    [X2,Y2]=ginput(4);

    A=zeros(8,8);
    B=zeros(8,1);
    for i=0:3
        A(2*i+1,:)=[X1(i+1) Y1(i+1) 1 0 0 0 -X1(i+1)*X2(i+1) -Y1(i+1)*X2(i+1)];
        A(2*i+2,:)= [0 0 0 X1(i+1) Y1(i+1) 1 X1(i+1)*Y2(i+1) -Y1(i+1)*Y2(i+1)];
        B(2*i+1)=X2(i+1);
        B(2*i+2)=Y2(i+1);
    end
        
    
    h=(1/(transpose(A)*A))*transpose(A)*B;
    
    disp('la matrice homotetie est ')
    disp(h)
end

