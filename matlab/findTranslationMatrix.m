function translation = findTranslationMatrix(centre_face, centre_translated)
% Given centres of facial features, find translation matrix to
% transform centre_face into centre_translated
% centre_face and centre_translated are both structures containing
% eyeL, eyeR, nose, mouth
% each of the features are points with x y coords
% eg. centre_face.eyeL.x

Dx1=centre_translated.eyeL.x-centre_face.eyeL.x;
Dx2=centre_translated.eyeR.x-centre_face.eyeR.x;
Dx3=centre_translated.nose.x-centre_face.nose.x;
Dx4=centre_translated.mouth.x-centre_face.mouth.x;
Dx=mean([Dx1,Dx2,Dx3,Dx4]);

Dx1=centre_translated.eyeL.y-centre_face.eyeL.y;
Dx2=centre_translated.eyeR.y-centre_face.eyeR.y;
Dx3=centre_translated.nose.y-centre_face.nose.y;
Dx4=centre_translated.mouth.y-centre_face.mouth.y;
Dy=mean([Dy1,Dy2,Dy3,Dy4]);

translation = [1 0 Dx; 0 1 Dy; 0 0 1];
