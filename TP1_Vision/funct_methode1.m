function [MP2norm,MP3norm] = funct_methode1(MP2,MP3)
    %Calcule du baricentre :

    [baryx,baryX] = funct_bary(MP2,MP3);
    
    %On retranche les coordonnées du barycentre à chacun des point
    MP2dt  = MP2 - baryx ;                            %en 2D
    MP3dt  = MP3 - baryX ;                            %en 2D
    
    %On cherche la moyenne des normes :
    m2 = sqrt(mean(MP2(1,:).^2)+mean(MP2(2,:).^2)-(baryx(1,1).^2+baryx(2,1).^2));   
    m3 = sqrt(mean(MP3(1,:).^2)+mean(MP3(2,:).^2)+mean(MP3(3,:).^2)-(baryX(1,1).^2+baryX(2,1).^2+baryX(3,1).^2));
    
    %On cherche a normalise les points :
    MP2norm = MP2dt.*(sqrt(2)/m2);
    MP3norm = MP3dt.*(sqrt(3)/m3);
    %vectnorm = { normMP2dt ; normMP3dt};
    
    % m2p = mean(vecnorm(normMP2dt, 2, 1));
    % m3p = mean(vecnorm(normMP3dt, 2, 1));
    % 
    % %Teste du nouveau barycentre
    % 
    % [baryxp, baryXp] = funct_bary(normMP2dt, normMP3dt);
    % % Conclusion on obtient bien ce qui est attendue avec la méthode 1.
    % %funct_affichage(vectnorm);
    % 
    % 
    % %Point d'origine
    % %cellplan = { MP2d ; MP3d};
    % 
    % %funct_affichage(cellplan);
end