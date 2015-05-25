function translation = findTranslationMatrix(centre_face, centre_translated)
% Given centres of facial features, find rotation matrix to
% transform centre_face into centre_translated
% centre_face and centre_translated are both structures containing
% eyeL, eyeR, nose, mouth
% each of the features are points with x y coords
% eg. centre_face.eyeL.x