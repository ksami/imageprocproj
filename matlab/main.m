% Main %

clear;

% Paths to files
f_face = '../data/face.jpg';
f_uv = '../data/uv.png';
f_result = '../data/result.jpg';


% Load images from file %

% Load face image
img = imread(f_face);  %uint8 * 3

% Load uv texture map (3D projection mask)
img_uv = imread(f_uv);  %uint8


% Obtain bounding box for facial features %
detector = buildDetector();
[boundingBoxes, img_bb, ~, ~] = detectFaceParts(detector,img);
% imshow(img_bb);  %//debug


% Get rid of background and hair %

% Obtain mask for skin areas
mask_skin = findSkinRegion(img);
% Selects largest area (hopefully skin not skin-coloured bkgrnd)
mask_skin = bwareafilt(logical(mask_skin), 1);
% Fills in any holes
mask_skin = uint8(imfill(mask_skin, 'holes'));
% imshow(mask_skin*255);  %//debug

% Mask other parts of the image
img_face(:,:,1) = mask_skin .* img(:,:,1);
img_face(:,:,2) = mask_skin .* img(:,:,2);
img_face(:,:,3) = mask_skin .* img(:,:,3);
imshow(img_face);  %//debug


% % Find centres of facial features in img_uv %
% % Find centres of facial features in img_face %
% 
% % Find translation matrix %
% translation = findTranslationMatrix(img, translatedImg);
% 
% % Find rotation matrix %
% rotation = findRotationMatrix(img, rotatedImg);
% 
% % Find scaling matrix %
% scaling = findScalingMatrix(img, scaledImg);
% 
% % Compose transformations %
% img_face = scaling * rotation * translation * img_face;
% 
% 
% % Save output image to file %
% imwrite(img_face, f_result);