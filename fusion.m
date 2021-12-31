function [img,M,B]=fusion(img1,M1,B1,img2,M2,B2)
[h1,w1,z1]=size(img1);
[h2,w2,z2]=size(img1);
if (z1~=z2)
    disp('erreur, les deux images ne sont pas de même tailles en z')
end
B(1,1)=1;
B(1,2)=max(B1(1,2),B2(1,2))-min(B1(1,1),B2(1,1));
B(2,1)=max(B1(2,1),B2(2,1))-min(B1(2,2),B2(2,2));
B(2,2)=1;

%%Gestion du décalage sur x
val1=B1(1,1);
val2=B2(1,1);
disp('xmin:')
disp(val1)
disp('xmin:')
disp(val2)
[mini]=min(val1,val2);
if mini==val1
    i=1;
    mini=val2-val1;
else
    i=2;
    mini=val1-val2;
end
if (mini <0)
    if (i==1)
        nimg1=img1;
        nM1=M1;
        
        nimg2=[zeros(B(2,1),-mini,z1); img2];
        nM2=[zeros(B(2,1),-mini); M2];
    else
        nimg2=img2;
        nM2=M2;
        nimg1=[zeros(B(2,1),-mini,z1); img1];
        nM1=[zeros(B(2,1),-mini); M1];
    end
else
    nM1=M1;
    nimg1=img1;
    nimg2=img2;
    nM2=M2;
end
%%Gestion du décalage sur y

val1=B1(2,2);
val2=B2(2,2);
disp('ymin:')
disp(val1)
disp('ymin:')
disp(val2)
[mini]=min(val1,val2);
if mini==val1
    i=1;
    mini=val2-val1;
    else
    i=2;
    mini=val1-val2;
end

if (mini <0)
    if (i==1)
        nimg1=img1;
        nM1=M1;
        nimg2=[zeros(-mini,B(1,2),z1), img2];
        nM2=[zeros(-mini,B(1,2)), M2];
    else
        nimg2=img2;
        nM2=M2;
        nimg1=[zeros(-mini,B(1,2),z1), img1];
        nM1=[zeros(-mini,B(1,2)), M1];
    end
else
    nM1=M1;
    nimg1=img1;
    nimg2=img2;
    nM2=M2;
end


%%Fusion
img=zeros(B(2,1),B(1,2),z1);
M=zeros(B(2,1),B(1,2));

for y=1:B(2,1)
    for x=1:B(1,2)
        if (nM2(y,x)==1)
            img(y,x,:)=nimg2(y,x,:);
            M(y,x)=1;
        elseif (nM1(y,x)==1)
            img(y,x,:)=nimg1(y,x,:);
            M(y,x)=1;
        else
            M(y,x)=0;
        end
    end
end

end
        