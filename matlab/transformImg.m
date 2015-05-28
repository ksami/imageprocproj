function transformedImg = transformImg(img, translation, rotation, scaling, centre_uv)
% Given img and the 3 transformation matrices,
% apply transformations in the order
% (translation -> rotation -> scaling) to obtain transformedImg
% [newx; newy; 1] = [scaling] * [rotation] * [translation] * [x; y; 1]
% img: uint8 * 3
% transformedImg: uint8 * 3

transformedImg = zeros(size(img), 'uint8');
[row, col, dim] = size(img);

for i=1:dim
    for y=1:row
        for x=1:col
            xyT = translation * [x; y; 1];
            dx=centre_uv.nose.x-1;
            dy=centre_uv.nose.y-1;
            xyT1=xyT-[dx; dy; 1];
            
            xyTR = rotation * xyT1;
%             xyTRS0 = scaling * xyTR;
            xyTRS = xyTR+[dx; dy; 1];
          
            
            %//todo need to move origin to apply rot and scale
%             xyTR = rotation * xyT;
%             xyTRS = scaling * xyTR;
            
            % Handle out-of-bounds and decimal
            newx = floor(xyTRS(1));
            newy = floor(xyTRS(2));
            
            if((newx>0 && newx<=col) && (newy>0 && newy<=row))
                transformedImg(newy, newx, i) = img(y, x, i);
            end
        end
    end
end
