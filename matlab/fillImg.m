function filledImg = fillImg(img)
% Fills in the gaps resulting from an image being scaled

img=double(img);
[row, col, dim] = size(img);
filledImg=zeros(size(img));
pizza=zeros(size(img));

for d=1:dim
    chicken=img(:,:,d);
    chicken=padarray(chicken,[1 1]);
    
    for y=2:row+1
        for x=2:col+1
            sum=0;
            count = 0;
            
            if (chicken(y,x)==0)
                
                for dy=-1:1:1
                    for dx=-1:1:1
                        sum = sum + chicken(y+dy,x+dx);
                        if (chicken(y+dy,x+dx)>0.1)
                            count=count+1;
                        end
                    end
                end
                
                if (count==0)
                    pizza(y,x)=0;
                else
                    pizza(y,x)=sum/count;
                end
                
            else
                pizza(y,x)=chicken(y,x);
            end
            
        end
    end
    filledImg(:,:,d)=pizza(2:row+1,2:col+1);
end
filledImg=uint8(filledImg);
end
