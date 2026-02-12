function [] = affiche_image(lots_images)
    [N,M] = size(lots_images);
    figure;
    for j=1:N
        for i=1:M
                img = uint8(lots_images{i}{1});
                subplot(j,M,i);
                hold on
                imshow(img); 
                if(size(lots_images{i}, 2)~=1)
                    title(lots_images{i}{2}); 
                end    
        end
    end
end 