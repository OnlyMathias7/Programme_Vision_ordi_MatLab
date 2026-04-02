clc, clear, close all

img_1 = double(imread('street14.tif'));
img_2 = double(imread('street15.tif')); 
lambda = 2;
max_iter=200; 

[u, v] = algo_estimation_mouvement(img_1, img_2, lambda, max_iter);

% Affichage
figure(1)
subplot(1,3,1);
imshow(img_1,[]);
hold on;
step=0.5;
quiver(u(1:step:end,1:step:end),v(1:step:end,1:step:end),'r');
title(['champ de mouvement lambda=',num2str(lambda)]);
subplot(1,3,2);
imshow(uint8(img_1));
title('image street 14')
subplot(1,3,3);
imshow(uint8(img_2));
title('image street 15')