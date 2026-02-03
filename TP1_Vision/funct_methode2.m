function [MP2norm,MP3norm, T, U] = funct_methode2(MP2,MP3)
    %Calcule du baricentre :

    [baryx,baryX] = funct_bary(MP2,MP3);
 
    %On cherche alpha et t = (tx; ty)
    m2 = sqrt(mean(MP2(1,:).^2)+mean(MP2(2,:).^2)-(baryx(1,1).^2+baryx(2,1).^2));   
    m3 = sqrt(mean(MP3(1,:).^2)+mean(MP3(2,:).^2)+mean(MP3(3,:).^2)-(baryX(1,1).^2+baryX(2,1).^2+baryX(3,1).^2));
    
    alpha2D = sqrt(2) / m2; % Normalization factor for 2D
    
    t = [baryx(1)*(-alpha2D); baryx(2)*(-alpha2D)]; % Translation vector for 2D
    T = [alpha2D 0 t(1); 
         0   alpha2D t(2);
         0     0       1 ];
    
    
    beta3D = sqrt(3) / m3; % Normalization factor for 3D
    t = [baryX(1)*(-beta3D); baryX(2)*(-beta3D) ; baryX(3)*(-beta3D)]; % Translation vector for 3D
    U = [beta3D 0  0     t(1); 
         0   beta3D 0     t(2);
         0     0   beta3D t(3);
         0     0     0      1];
    
    MP2norm = T * MP2;
    MP3norm = U * MP3;
end