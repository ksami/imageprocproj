function mask_skin = findSkinRegion(img)
% Given an image of a face, create a mask to mark out the regions
% where skin is
% Inputs : [RGB] img
% Outputs: [binary uint8] mask_skin


red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

[row, col, ~] = size(img);
mask_skin = zeros(row, col, 'uint8');

for i=1:row
    for j=1:col
        R = red(i,j);
        G = green(i,j);
        B = blue(i,j);
        
        % Rules for deciding if a pixel is skin-coloured (fair skin)
        % 
        % R > 95 AND G > 40 AND B > 20 AND 
        % max{R, G, B} - min{R, G, B} >15 AND
        % |R - G| > 15 AND
        % R > G AND R > B
        % 
        % OR
        % 
        % R > 220 AND G > 210 AND B > 170 AND
        % |R - G| <= 15 AND
        % R > B AND G > B
        if( ... 
            ( ...
                ( R>95 && G>40 && B>20 ) && ...
                ( (max([R G B]) - min([R G B])) > 15 ) && ...
                ( abs(R-G) > 15 ) && ...
                ( R>G && R>B ) ...
            ) || ...
            ( ...
                ( R>220 && G>210 && B>170 ) && ...
                ( abs(R-G) <= 15 ) && ...
                ( R>B && G>B ) ...
            ) ...
          )
            mask_skin(i,j)=1;
        end
        
    end
end
