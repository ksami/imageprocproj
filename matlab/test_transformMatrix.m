% Test script for transformation matrices
img = [
0 0 0 0 0;
0 1 0 0 0;
0 0 0 0 0;
0 0 0 1 0;
0 0 0 0 0
];

rotatedImg = [
0 0 0 0 0;
0 0 0 0 0;
0 1 0 1 0;
0 0 0 0 0;
0 0 0 0 0
];

translatedImg = [
1 0 0 0 0;
0 0 0 0 0;
0 0 1 0 0;
0 0 0 0 0;
0 0 0 0 0
];

scaledImg = [
1 0 0 0 0;
0 0 0 0 0;
0 0 0 0 0;
0 0 0 0 0;
0 0 0 0 1
];

% Correct results %
rotation = [
cos(-45) sin(-45) 0;
-sin(-45) cos(-45) 0;
0 0 1
];

translation = [
1 0 -1;
0 1 -1;
0 0 1
];

scale = [
2 0 0;
0 2 0;
0 0 1
];


test_rotation = findRotationMatrix(img, rotatedImg);
test_translation = findTranslationMatrix(img, translatedImg);
test_scaling = findScalingMatrix(img, scaledImg);
% test_translation = translation;
% test_rotation = rotation;
% test_scaling = scale;

resrot = test_rotation-rotation;
restrans = test_translation-translation;
resscale = test_scaling-scale;

% Check result matrix if all zeros %
flagrot = 0;
flagtrans = 0;
flagscale = 0;
for i=1:size(rotation,1)
    for j=1:size(rotation,2)
        if(resrot(i,j)~=0)
            flagrot = 1;
        end
        if(resscale(i,j)~=0)
            flagscale = 1;
        end
        if(restrans(i,j)~=0)
            flagtrans = 1;
        end
    end
end

% Print results %
if(flagrot == 0)
    disp('Passed: findRotationMatrix test passed');
else
    disp('FAILED: findRotationMatrix test failed');
    disp(test_rotation);
end

if(flagtrans == 0)
    disp('Passed: findTranslationMatrix test passed');
else
    disp('FAILED: findTranslationMatrix test failed');
    disp(test_translation);
end

if(flagscale == 0)
    disp('Passed: findScalingMatrix test passed');
else
    disp('FAILED: findScalingMatrix test failed');
    disp(test_scaling);
end