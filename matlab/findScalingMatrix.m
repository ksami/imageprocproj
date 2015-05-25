function scaling = findScalingMatrix(centre_face, centre_scaled)
% Given centres of facial features, find rotation matrix to
% transform centre_face into centre_scaled
% centre_face and centre_scaled are both structures containing
% eyeL, eyeR, nose, mouth
% each of the features are points with x y coords
% eg. centre_face.eyeL.x