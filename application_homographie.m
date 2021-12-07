function[imgtransforme mask]=application_homographie(img1,hmat)
[h,w,z ]=size(img1);
imgtransforme=zeros(h,w,z);
mask=zeros(h,w);

for k=1:h
    for j=1:w
        y=floor((hmat(1,1)*k+hmat(1,2)*j+hmat(1,3))/(hmat(3,1)*k+hmat(3,2)*j+hmat(3,3)));
        x=floor((hmat(2,1)*k+hmat(2,2)*j+hmat(2,3))/(hmat(3,1)*k+hmat(3,2)*j+hmat(3,3)));
        if (x>0 && x<h+1 && y>0 && y<w+1)
            imgtransforme(x,y)= img1(j,k);
            mask(x,y)=1;
        end

    end
end
end