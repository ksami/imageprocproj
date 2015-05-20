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
        if (check==0 && mask(j,i)==1)
            tl = [j,i];
            check=1;
        end
    end
end

%find bottom right corner of rectangular region
check=0;
for i=row:-1:1
    for j=col:-1:1
        if (check==0 && mask(j,i)==1)
            br = [j,i];
            check=1;
        end
    end
end

%center of rectangular region
centre.x=br(2)-tl(2);
centre.y=br(1)-tl(1);

end
