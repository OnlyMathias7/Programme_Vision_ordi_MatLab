clc, clear, close all,


% Image à utiliser 
img = double(imread('photophore.tif'));
n = size(img);
alpha = 2;
img_bruite = img + 10*randn(size(img));
img_est = algo_iter_Gauss_Seidel(img_bruite,alpha, 1000);
flt = ones(5);
flt = flt/sum(sum(flt));
img_filtre = conv2(img_est,flt,'same');


lots_image = {img,img_bruite, img_est, img_filtre};
affiche_image(lots_image);