function sigma = performance(img, img_bruit)
    
    [N,M] = size(img);
    sigma_col = [];
    for i=1:N
        sigma_col(i) = mean((img(i,:)-img_bruit(i,:)).^2);
    end
    sigma = mean(sigma_col);
end 