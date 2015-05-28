% Main %

clear;

% Paths to files
f_face = '../data/face.jpg';  %RGB, variable
f_uv = '../data/uv_m_box.jpg';  %RGB, 256x256
f_result = '../result.jpg';  %RGB, 256x256


% Load images from file %
% Load uv texture map (3D projection mask)
img_uv = imread(f_uv);  %uint8 * 3

% Load face image
img = imread(f_face);  %uint8 * 3
img = imresize(img, [size(img_uv,1) size(img_uv,2)]);


% Obtain bounding box for facial features %
detector = buildDetector();
[box_face, img_bb, ~, ~] = detectFaceParts(detector,img);
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
% imshow(img_face);  %//debug



% Find centres of facial features in img_uv %
% Create masks for each feature
temp_mask_eyes_uv = uint8(im2bw(img_uv(:,:,1), 0.25));  %red
mask_uv.eyeL = uint8(im2bw(img_uv(:,:,1), 0.75));
mask_uv.eyeR = temp_mask_eyes_uv - mask_uv.eyeL;
% imshow(mask_uv.eyeR*255);  %//debug
mask_uv.nose = uint8(im2bw(img_uv(:,:,2), 0.75));  %green
mask_uv.mouth = uint8(im2bw(img_uv(:,:,3), 0.75));  %blue

% Find centres for each of the boxes
centre_uv.eyeL = findCentreRectMask(mask_uv.eyeL);
centre_uv.eyeR = findCentreRectMask(mask_uv.eyeR);
centre_uv.nose = findCentreRectMask(mask_uv.nose);
centre_uv.mouth = findCentreRectMask(mask_uv.mouth);


% Find centres of facial features in img_face %
centre_face.eyeL = findCentrePoints(box_face(:,5:8));
centre_face.eyeR = findCentrePoints(box_face(:,9:12));
centre_face.nose = findCentrePoints(box_face(:,13:16));
centre_face.mouth = findCentrePoints(box_face(:,17:20));


% Find translation matrix %
translation = findTranslationMatrix(centre_face, centre_uv);
% Apply translation
centre_faceT = transformCentres(centre_face, translation);

% translate for offset
dx = - centre_uv.nose.x + 1;
dy = - centre_uv.nose.y + 1;
offset = [1 0 dx; 0 1 dy; 0 0 1];
centre_uvo = transformCentres(centre_uv, offset);


% Find rotation matrix %
rotation = findRotationMatrix(centre_faceT, centre_uv);

% Apply rotation 
centre_faceTo = transformCentres(centre_faceT, offset);
centre_faceTR = transformCentres(centre_faceTo, rotation);

% offset backwards
dx = -dx;
dy = -dy;
offset = [1 0 dx; 0 1 dy; 0 0 1];
centre_faceTRO = transformCentres(centre_faceTR, offset);
centre_uvo = transformCentres(centre_uv, offset);

% Find scaling matrix %
scaling = findScalingMatrix(centre_faceTR, centre_uvo);

% Compose transformations %
img_face = transformImg(img_face, translation, rotation, scaling, centre_uv);
imshow(img_face)  %//debug

% Save output image to file %
imwrite(img_face, f_result);
