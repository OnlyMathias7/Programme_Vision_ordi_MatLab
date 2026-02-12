function [] = affiche_image(lots_images)
    [N,M] = size(lots_images);
    figure;
    for j=1:N
        for i=1:M
            img = uint8(lots_images{i});
            subplot(j,M,i);
            hold on
            imshow(img);   
        end
    end
end 