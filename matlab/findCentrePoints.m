function centre = findCentrePoints(points)
% Given points[topleft.x, topleft.y, width, height] describing box
% returns centre of box

centre.x = points(1) + (points(3)/2);
centre.y = points(2) + (points(4)/2);