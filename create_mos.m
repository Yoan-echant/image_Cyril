function [mosa]=create_mos(img1,img2,hinv)
    
    [l1,w1,n]=size(img1);
    [l2,w2,n]=size(img2);
    img1=[  zeros(size(img2)) zeros(l1,w2)  zeros(size(img2));
            zeros(l2,w1)      img1          zeros(l2,w1);
            zeros(size(img2)) zeros(l1,w2)  zeros(size(img2))];
        
    [le,w,n]=size(img1);
    mos=zeros(siz);
    
    for i=1:le
        for j=1:w
            [k,l,n]=round(hinv*[i,j,1]);
            if(0<k && 0<l && k<le && l<w)
            mos(i,j,:)=(img1(i,j,:)+img2(k,l,:))/2;
            else
                mos(i,j,:)=img1(i,j,:);
            end
        end
    end
    %%Avant de finir, on rogne les bords pour ne pas avoir une image trop
    %%grande
    for left=0:le
        if (sum(sum(left+1,:,:))~=0)
            break;
        end  
    end
    right=0;
    for i=le:-1:1
        if (sum(sum(i,:,:))~=0)
            break;
        end
        right=right+1;
    end
 
    for up=1:w
        if (sum(sum(:,up+1,:))~=0)
            break;
        end
    end
    down=0;
    for i=le:-1:1
        if (sum(sum(:,i,:))~=0)
            break;
        end
        down=down+1;
    end
    mosa=mos(left:right,up:down,:);
    
end