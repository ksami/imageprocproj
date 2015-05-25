function rotation = findRotationMatrix(centre_face, centre_rotated)
% Given centres of facial features, find rotation matrix to
% transform centre_face into centre_rotated
% centre_face and centre_rotated are both structures containing
% eyeL, eyeR, nose, mouth
% each of the features are points with x y coords
% eg. centre_face.eyeL.x

%offset eyeL (original) and eyeL1 (rotated); nose as origin; express as x y coords
eyeL = [centre_face.eyeL.x - centre_face.nose.x + 1, centre_face.eyeL.y - centre_face.nose.y + 1];
eyeL1 = [centre_rotated.eyeL.x - centre_face.nose.x + 1, centre_rotated.eyeL.y - centre_face.nose.y + 1];

%find angle between eyeL (original) and eyeL1 (rotated)
costheta = (dot(eyeL, eyeL1))/((norm(eyeL))*(norm(eyeL1)));
theta = acos(costheta);

%check whether angle (theta) is negative
xaxis = [1,0];
rho = acos((dot(eyeL, xaxis))/((norm(eyeL))*(norm(xaxis))));
rho1 = acos((dot(eyeL1, xaxis))/((norm(eyeL1))*(norm(axis))));
if (rho1>rho)
    theta = -theta;
end

%build rotation matrix, where [x'; y'; 1]=[rotation]*[x; y; 1]
rotation = [cos(theta), -sin(theta), 0; sin(theta), cos(theta), 0; 0, 0, 1];
end
