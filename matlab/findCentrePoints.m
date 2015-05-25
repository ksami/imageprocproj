function centre = findCentrePoints(points)
% Given points[topleft.x, topleft.y, width, height] describing box
% returns centre of box

centre.x = floor(points(1) + (points(3)/2));
centre.y = floor(points(2) + (points(4)/2));