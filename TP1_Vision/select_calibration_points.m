function MP2 = select_calibration_points(image_path, n_points)
    % Cette fonction permet de sélectionner manuellement les points dans l'image.
    % Attention : les coordonnées 3D correspondantes doivent être définies 
    % séparément dans le code ou obtenues via une autre fonction.
    
    % Charger l'image
    img = imread(image_path);
    % Afficher avec zoom
    figure('Position', [100, 100, 1200, 800]);
    imshow(img);
    title('Sélection des points - Utilisez le zoom si nécessaire');
    
    
    % Sélectionner les points
    fprintf('\nCliquez sur %d points (coins des carrés)\n', n_points);
    fprintf('Appuyez sur Entrée après chaque clic\n\n');
    
    x = zeros(n_points, 1);
    y = zeros(n_points, 1);
    
    hold on;
    for i = 1:n_points
    
        zoom on; % Activer le zoom
        disp('Zoomez sur la zone d''intérêt, puis pressez Entrée');
        pause; % Attendre que l'utilisateur zoome
        fprintf('Point %d - ', i);
        [xi, yi] = ginput(1);
        x(i) = xi;
        y(i) = yi;
        
        % Afficher le point et son numéro
        plot(xi, yi, 'r+', 'MarkerSize', 15, 'LineWidth', 2);
        text(xi+10, yi-10, sprintf('%d', i), 'Color', 'yellow', ...
             'FontSize', 12, 'FontWeight', 'bold');
        
        fprintf('Coordonnées (%.2f, %.2f)\n', xi, yi);
    end
    
    % Créer MP2
    MP2_pixel = [x'; y'; ones(1, n_points)];
    % hauteur = size(img, 1);
    % MP2 = pixels_to_cartesian( MP2_pixel, hauteur );
    MP2 = MP2_pixel;


    
    % Sauvegarder
    save('points_2D.mat', 'MP2');
    disp(' ');
    disp('Matrice MP2 sauvegardée dans points_2D.mat');
    disp(MP2);
end 