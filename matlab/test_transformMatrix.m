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

rotation = [
cos(-45) sin(-45);
-sin(-45) cos(-45)
];

% test_rotation = findRotationMatrix(img, rotatedImg);
rot = zeros(size(img));
for y=1:5
    for x=1:5
        new = rotation * [x; y];
        rot(floor(new(2)),floor(new(1))) = img(y,x);
    end
end
disp(rot);