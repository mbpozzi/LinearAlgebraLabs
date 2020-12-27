function [ T ] = DCT_for_vectorized_images( npixels )
% npixels, is the number of pixels of the image to compress
%   T is the DCT transformation matrix
D = dctmtx(npixels);
T = kron(D,D);

end
