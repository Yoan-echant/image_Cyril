function[imgtransforme, mask, Bf]=application_homographie(img1,M,B,hm)
hmat=inv(hm);

[h2,w2,z2]=size(img1);


y1=floor((hm(1,1)*B(2,1)+hm(1,2)*B(1,1)+hm(1,3))/(hm(3,1)*B(2,1)+hm(3,2)*B(1,1)+hm(3,3)));
x1=floor((hm(2,1)*B(2,1)+hm(2,2)*B(1,1)+hm(2,3))/(hm(3,1)*B(2,1)+hm(3,2)*B(1,1)+hm(3,3)));
y2=floor((hm(1,1)*B(2,2)+hm(1,2)*B(1,2)+hm(1,3))/(hm(3,1)*B(2,2)+hm(3,2)*B(1,2)+hm(3,3)));
x2=floor((hm(2,1)*B(2,2)+hm(2,2)*B(1,2)+hm(2,3))/(hm(3,1)*B(2,2)+hm(3,2)*B(1,2)+hm(3,3)));
X=[x1,x2];
Y=[y1,y2];

Bf=[min(X), max(X);max(Y),min(Y)];

h=Bf(1,2)-Bf(1,1);
w=Bf(2,1)-Bf(2,2);
imgtransforme=zeros(h,w,z2);
mask=zeros(h,w);
for i=Bf(1,1):Bf(1,2)
    for j=Bf(2,2):Bf(2,1)
        y=floor((hmat(1,1)*j+hmat(1,2)*i+hmat(1,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        x=floor((hmat(2,1)*j+hmat(2,2)*i+hmat(2,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        if (x>0 && x<h2+1 && y>0 && y<w2+1 && M(x,y)==1)
            imgtransforme(i-Bf(1,1)+1,j-Bf(2,2)+1,:)=img1(x,y,z2);
            mask(i-Bf(1,1)+1,j-Bf(2,2)+1)=1;
        end
    end
end

