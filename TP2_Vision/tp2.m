clc, clear, close all,


% Image à utiliser 
img = double(imread('photophore.tif'));
n = size(img);
alpha = 05;
img_bruite = img + 150*randn(size(img));
img_est = algo_iter_Gauss_Seidel(img_bruite,alpha, 1000);
flt = ones(5);
flt = flt/sum(sum(flt));
img_filtre = conv2(img_est,flt,'same');


lots_image = {{img, "Image de Base"},{img_bruite, "Image bruité"}, {img_est, "Image restaurée"}, {img_filtre, "Image filtré"}};
affiche_image(lots_image);