function filledImg = fillImg(img)
% Fills in the gaps resulting from an image being scaled

[row, col, dim] = size(img);

for d=1:dim
    for y=1:row
        for x=1:col
            for dy=-1:1:1
                for dx=-1:1:1
                end
            end
        end
    end
end