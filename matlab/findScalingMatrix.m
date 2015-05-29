function scaling = findScalingMatrix(centre_face, centre_scaled)
% Given centres of facial features, find scaling matrix to
% transform centre_face into centre_scaled
% centre_face and centre_scaled are both structures containing
% eyeL, eyeR, nose, mouth
% each of the features are points with x y coords
% eg. centre_face.eyeL.x
% first offset nose to 1,1

%offset values
% dx1=centre_scaled.nose.x-1;
% dx2=centre_face.nose.x-1;
% dy1=centre_scaled.nose.y-1;
% dy2=centre_face.nose.y-1;
dx1 = 0;
dx2 = 0;
dy1=0;
dy2=0;

Sx1=(centre_scaled.eyeL.x-dx1)/(centre_face.eyeL.x-dx2);
Sx2=(centre_scaled.eyeR.x-dx1)/(centre_face.eyeR.x-dx2);
% Sx3=(centre_scaled.mouth.x-dx1)/(centre_face.mouth.x-dx2);
Sx=mean([Sx1,Sx2]);
% Sx = 1;
% errorx=[(Sx1-Sx)/Sx,(Sx2-Sx)/Sx]; %error given as a ratio, *100 to become percentage
% disp(errorx);

Sy1=(centre_scaled.eyeL.y-dy1)/(centre_face.eyeL.y-dy2);
% Sy2=(centre_scaled.eyeR.y-dy1)/(centre_face.eyeR.y-dy2);
Sy2=(centre_scaled.mouth.y-dy1)/(centre_face.mouth.y-dy2);
Sy=mean([Sy1,Sy2]);
% Sy = 2;
% errory=[(Sy1-Sy)/Sy,(Sy2-Sy)/Sy]; %output is suppressed,consider putting as additional output of function
% disp(errory);

scaling = [Sx 0 0; 0 Sy 0; 0 0 1] ;
end

