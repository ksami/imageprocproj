function centre_trans = transformCentres(centre_face, transform)
% Transform coordinates, transform is 3 x 3 matrix
% [newx; newy; 1] = [transform] * [x; y; 1]

fields = fieldnames(centre_face);

for fd=fields'
    temp = transform * [centre_face.(fd{1}).x; centre_face.(fd{1}).y; 1];
    centre_trans.(fd{1}).x = temp(1);
    centre_trans.(fd{1}).y = temp(2);
end