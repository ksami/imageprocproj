function centre = findCentreRectMask(mask)
% Given a binary (consists only of 1s and 0s) matrix mask with one rectangular
% region of 1s, returns the centre of the rectangular region
% Inputs : [binary] mask
% Outputs: Structure centre{x, y}

centre.x = 0;
centre.y = 0;