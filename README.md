# imageprocproj

## todo

### 1st week
- [x] flesh out algorithm
- [x] transcribe details into softcopy
- [x] figure out blender/maya script
- [x] create 3d proj mask
- [ ] find sample data: faces
- [x] create skeleton code

### 2nd week
- [ ] fill in code for reading images
- [ ] fill in code for processing images
- [ ] testing

### 3rd week
- [ ] polish
- [ ] extensions


## Algorithm

### Outputs from algorithms/functions
- Bounding box for eyes nose mouth
    + eyes nose mouth mask
- faceSkinMask

### Other Inputs
- img
- 3D projection mask / 3D projection box mask

### Steps
1. Get rid of background and hair
    - Fill in skinless gaps/holes in faceSkinMask
        + Use eye bounding box
            * Start from top-left corner to bottom-right corner of eye box
            * Fill in any 0's found in faceSkinMask
        + Repeat for nose, mouth
    - Fill in any other gaps using blur/growedges (//todo Look for algo)
    - Multiply faceSkinMask with img -> imgFace
2. Find centres of eyes nose mouth boxes
    - Search columnwise to find breadth
    - Search rowwise to find length
    - centre = (topLeft.x+length/2, topLeft.y+breadth/2)
    - Repeat for 3D projection mask
3. Find rotation matrix
    - http://www.cs.uic.edu/~jbell/CourseNotes/ComputerGraphics/2DTransforms.html
    - Offset to use nose as origin for rotation
    - Deal with out of bounds
    - Aim for (eyeLCent.y-threshold < eyeRCent.y < eyeLCent.y+threshold)
    - difference = ((eyeLCent.y-eyeRCent.y)/2)
    - rotImg = {eyeLCent.y -= difference, eyeRCent.y += difference}
    - Pixel-wise operation: Value at (x,y) is moved to (newx,newy)
        + [rotation] = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1]  //rotation about origin(0,0)
        + [newx; newy; 1] = [rotation] * [x; y; 1]  //2d homogenous coordinates
        + newx = x * cos(theta) - y * sin(theta)s
        + newy = y * sin(theta) + y * cos(theta)
    - Obtain [rotation]
4. Find translation matrix
    - http://www.cs.uic.edu/~jbell/CourseNotes/ComputerGraphics/2DTransforms.html
    - Aim for nose to match 3D projection mask nose
    - transImg = {projMask.noseCent}
    - Pixel-wise operation: Value at (x,y) is moved to (newx,newy)
        + [translation] = [1 0 dx; 0 1 dy; 0 0 1]
        + [newx; newy; 1] = [translation] * [x; y; 1]  //2d homogenous coordinates
    - Obtain [translation]
5. Find scaling matrix
    - http://www.cs.uic.edu/~jbell/CourseNotes/ComputerGraphics/2DTransforms.html
    - Aim for eyes mouth match with 
    - scaleImg = {projMask.eyes, projMask.mouth}
    - Pixel-wise operation: Value at (x,y) is moved to (newx,newy)
        + [scale] = [sx 0 0; 0 sy 0; 0 0 1]  //scales about origin(0,0)
        + [newx; newy; 1] = [scale] * [x; y; 1]
    - Obtain [scale]
6. Compose transformations
    - Pixel-wise operation: Value at (x,y) is moved to (newx,newy)
        + Find order of transforms
        + Eg. [newx; newy; 1] = [scale] * [rotation] * [translation] * [x; y; 1]
    - note: rotation and scaling might result in gaps, okay to ignore?
