function [] = funct_verification(Pnorm,T,U,MP2,MP3)
    % 6. DÉNORMALISATION (Slide 35)
    % P = inv(T) * Pnorm * U
    P = inv(T) * Pnorm * U;
    
    disp('Matrice de projection P estimée :');
    disp(P);
    
    % 7. VERIFICATION (Projection)
    fprintf('\n--- VERIFICATION DES PROJECTIONS ---\n');
    MP2_est= P*MP3;
    MP2_est_cartesienne = funct_conv_homotodim(MP2_est);
    N= size(MP2,2);

    for i = 1:N
    fprintf('Point %d : Image[%.2f, %.2f] vs Projeté[%.2f, %.2f]\n', ...
    i, MP2(1,i), MP2(2,i), MP2_est_cartesienne(1,i), MP2_est_cartesienne(2,i));
    end
    
    % Calcul de l'erreur Euclidienne pour chaque point
    erreurs = sqrt(sum((MP2(1:2,:) - MP2_est_cartesienne).^2, 2));
    
    % Affichage de l'erreur moyenne
    fprintf('\nErreur moyenne de reprojection : %.4f pixels\n', mean(erreurs));

end 