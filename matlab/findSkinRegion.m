function mask_skin = findSkinRegion(img)
% Given an image of a face, create a mask to mark out the regions
% where skin is
% Inputs : [RGB] img
% Outputs: [binary] mask_skin
%
% Rules for deciding if a pixel is skin-coloured (fair skin)
% 
% R > 95 AND G > 40 AND B > 20 AND 
% max{R, G, B} – min{R, G, B} >15 AND
% |R – G| > 15 AND
% R > G AND R > B
% 
% OR
% 
% R > 220 AND G > 210 AND B > 170 AND
% |R – G| <= 15 AND
% R > B AND G > B

mask_skin = zeros(size(img));

[row, col] = size(img);

% for i=1:row
%     for j=1:col
%
%     end
% end
