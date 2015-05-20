# imageprocproj

## todo

### 1st week
- [x] flesh out algorithm
- [x] transcribe details into softcopy
- [ ] figure out blender/maya script
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
    - //todo invalid, need to use nose as origin for rotation
    - Aim for (eyeLCent.y-threshold < eyeRCent.y < eyeLCent.y+threshold)
    - difference = ((eyeLCent.y-eyeRCent.y)/2)
    - rotImg = {eyeLCent.y -= difference, eyeRCent.y += difference}
    - rotImg = [rotation] * eyesNoseMouthMask
    - Obtain [rotation]
4. Find translation matrix
    - Aim for nose to match 3D projection mask nose
    - transImg = {projMask.noseCent}
    - transImg = [translation] * noseMask
    - Obtain [translation]
5. Find scaling matrix
    - Aim for eyes mouth match with 
    - scaleImg = {projMask.eyes, projMask.mouth}
    - scaleImg = [scale] * eyesMouthMask
    - Obtain [scale]
6. Compose transformations
    - result = [scale] * [translation] * [rotation] * imgFace
    - note: rotation and scaling might result in gaps
