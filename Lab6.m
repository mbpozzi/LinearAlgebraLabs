%% Problem 1
%Load Picture
X = im2double(rgb2gray(imread('picture.tiff')));
%create a block of 32 x 32
Xblock = X(1:32,1:32);
%vectorize image
xblock = Xblock(:);
%create DCT matrix with 32 pixels
n = 32;
T = DCT_for_vectorized_images(n);
%check for invertibility
T_inv = inv(T);
T_Tinv = T * T_inv;
Tinv_T = T_inv * T;
error = matrix_error(T_Tinv, Tinv_T);
%Apply DCT Transform 
x_transform = T * xblock;
%stem plot 
figure(1);
stem(x_transform);
stem_vec = (1:100);
figure(2);
stem(stem_vec, x_transform(1:100));

%% Problem 2
%Test 
test = (1:999);
test_thresh = vector_thresholding(test,100);

%% Problem 3
% 1
yblock = x_transform;
K = round(.2 * length(yblock));
yblock_thresh = vector_thresholding(yblock,K);
figure(3);
stem(yblock_thresh);

% 2 
yblock_retro = T_inv * yblock_thresh;
Yblock = reshape(yblock_retro, [32,32]);
figure(4);
imshow(Xblock);
figure(5);
imshow(Yblock);
err = matrix_error(Yblock, Xblock);

%3 
K_vec = [.05, .1, .3, .5];

% for .05 
K_1 = round(K_vec(1) * length(yblock));
yblock_thresh_1 = vector_thresholding(yblock,K_1);
figure(6);
stem(yblock_thresh_1);
yblock_retro_1 = T_inv * yblock_thresh_1;
Yblock_1 = reshape(yblock_retro_1, [32,32]);
figure(7);
imshow(Yblock_1);
err_1 = matrix_error(Xblock, Yblock_1);

%for .1
K_2 = round(K_vec(2) * length(yblock));
yblock_thresh_2 = vector_thresholding(yblock,K_2);
figure(8);
stem(yblock_thresh_2);
yblock_retro_2 = T_inv * yblock_thresh_2;
Yblock_2 = reshape(yblock_retro_2, [32,32]);
figure(9);
imshow(Yblock_2);
err_2 = matrix_error(Xblock, Yblock_2);

%for .3
K_3 = round(K_vec(3) * length(yblock));
yblock_thresh_3 = vector_thresholding(yblock,K_3);
figure(10);
stem(yblock_thresh_3);
yblock_retro_3 = T_inv * yblock_thresh_3;
Yblock_3 = reshape(yblock_retro_3, [32,32]);
figure(11);
imshow(Yblock_3);
err_3 = matrix_error(Xblock, Yblock_3);

%for .5
K_4 = round(K_vec(4) * length(yblock));
yblock_thresh_4 = vector_thresholding(yblock,K_4);
figure(12);
stem(yblock_thresh_4);
yblock_retro_4 = T_inv * yblock_thresh_4;
Yblock_4 = reshape(yblock_retro_4, [32,32]);
figure(13);
imshow(Yblock_4);
err_4 = matrix_error(Xblock, Yblock_4);

%% Problem 4
Y = dct2(X);
y = Y(:);
K = round(.2 * length(y));
y_thresh = vector_thresholding(y,K);
figure(14);
stem(y_thresh);
y_retro = idct2(y_thresh);
Y_retro = reshape(y_retro, [512,512]);
figure(15);
imshow(Y_retro);
figure(16);
imshow(X);
error_whole = matrix_error(X,Y_retro)


K1 = round(.001 * length(y));
y_thresh1 = vector_thresholding(y,K1);
y_retro1 = idct2(y_thresh1);
Y_retro1 = reshape(y_retro1, [512,512]);
figure(18);
imshow(Y_retro1);
error_whole1 = matrix_error(X,Y_retro1)

K2 = round(.01 * length(y));
y_thresh2 = vector_thresholding(y,K2);
y_retro2 = idct2(y_thresh2);
Y_retro2 = reshape(y_retro, [512,512]);
figure(20);
imshow(Y_retro2);
error_whole2 = matrix_error(X,Y_retro2)

K3 = round(.05 * length(y));
y_thresh3 = vector_thresholding(y,K3);
y_retro3 = idct2(y_thresh3);
Y_retro3 = reshape(y_retro3, [512,512]);
figure(22);
imshow(Y_retro3);
error_whole3 = matrix_error(X,Y_retro3)

K4 = round(.1 * length(y));
y_thresh4 = vector_thresholding(y,K4);
y_retro4 = idct2(y_thresh4);
Y_retro4 = reshape(y_retro4, [512,512]);
figure(24);
imshow(Y_retro4);
error_whole4 = matrix_error(X,Y_retro4)