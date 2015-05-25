% Test script for findCentreRectMask.m
mask = [
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
];
centre = [6, 11];


test_centre = findCentreRectMask(mask);

if((test_centre.x-centre(2) == 0) && (test_centre.y-centre(1) == 0))
    disp('Passed: findCentreRectMask test passed');
else
    disp('FAILED: findCentreRectMask test failed');
    disp(centre);
end
