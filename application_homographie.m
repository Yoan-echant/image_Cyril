function[imgtransforme, mask]=application_homographie(img1,M,B,hmat)
hmat=inv(hmat);

[h2,w2,z2]=size(img1);
h=B(1,2);
w=B(2,2);
imgtransforme=zeros(h,w);
mask=zeros(h,w);

for i=B(1,1):B(1,2)
    for j=B(2,1):B(2,2)
        y=floor((hmat(1,1)*j+hmat(1,2)*i+hmat(1,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        x=floor((hmat(2,1)*j+hmat(2,2)*i+hmat(2,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        if (x>0 && x<h2+1 && y>0 && y<w2+1 && M(x,y)==1)
            imgtransforme(i,j,:)=img1(1,1,z2);
            mask(i,j)=1;
        end
    end
end