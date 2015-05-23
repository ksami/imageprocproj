% Main %

% Paths to files
f_face = '../data/face.jpg';
f_uv = '../data/uv.png';
f_result = '../data/result.jpg';


% Load images from file %

% Load face image
img = imread(f_face);

% Load uv texture map (3D projection mask)
img_uv = imread(f_uv);


% Obtain bounding box for facial features %

% Obtain mask for skin areas %


% Get rid of background and hair %
% Fill in skinless gaps/holes in skin mask
% Fill in any other gaps
% Mask other parts of the image
img_face = skinMask * img;

% Find centres of facial features in img_uv %
% Find centres of facial features in img_face %

% Find translation matrix %
translation = findTranslationMatrix(img, translatedImg);

% Find rotation matrix %
rotation = findRotationMatrix(img, rotatedImg);

% Find scaling matrix %
scaling = findScalingMatrix(img, scaledImg);

% Compose transformations %
img_face = scaling * rotation * translation * img_face;


% Save output image to file %
imwrite(img_face, f_result);