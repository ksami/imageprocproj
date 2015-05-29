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
            
            % move nose to origin, rotate, move nose back
            dx = centre_uv.nose.x-1;
            dy = centre_uv.nose.y-1;
            xyT = xyT-[dx; dy; 1];
            xyTR = rotation * xyT;
            xyTRS = scaling * xyTR;
            xyTRS = xyTRS+[dx; dy; 1];
            
            % move centre of scaling to origin, scale, move back
%             dx = - ((centre_uv.eyeL.x + centre_uv.eyeR.x) / 2) + 1;
%             dy = - ((centre_uv.eyeL.y + centre_uv.mouth.y) / 2) + 1;
% %             dx = -30;
% %             dy = -30;
%             xyTR = xyTR+[dx; dy; 1];
%             xyTRS = scaling * xyTR;
%             xyTRS = xyTRS-[dx; dy; 1];

            
            % Handle out-of-bounds and decimal
            newx = floor(xyTRS(1));
            newy = floor(xyTRS(2));
            
            if((newx>0 && newx<=col) && (newy>0 && newy<=row))
                transformedImg(newy, newx, i) = img(y, x, i);
            end
        end
    end
end
