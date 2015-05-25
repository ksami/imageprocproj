function centre = findCentreRectMask(mask)
% Given a binary (consists only of 1s and 0s) matrix mask with one rectangular
% region of 1s, returns the centre of the rectangular region
% Inputs : [binary] mask
% Outputs: Structure centre{x, y}

centre.x = 0;
centre.y = 0;

[row, col] = size(mask);    

%find top left corner of rectangular region
check=0;
for i=1:row
    for j=1:col
        if (check==0 && mask(i,j)==1)
            tl = [i,j];
            check=1;
        end
    end
end

%find bottom right corner of rectangular region
check=0;
for i=row:-1:1
    for j=col:-1:1
        if (check==0 && mask(i,j)==1)
            br = [i,j];
            check=1;
        end
    end
end

%center of rectangular region
centre.x=floor((br(2)+tl(2))/2);
centre.y=floor((br(1)+tl(1))/2);
