clc, clear, close all,

% coordonné en image homogenes (2D)
MP2d = [ 278 150 224 351 456 525 ;
         116 182 381 439 172 300 ;                 %matrice de points en 2D
          1   1   1   1   1   1   ];
% coordonné en espace homogenes (3D)
MP3d = [ 0 0 4 7 6 4 ;
         2 5 5 4 0 0 ; 
         4 3 0 0 1 3 ;
         1 1 1 1 1 1 ];                            %matrice de points en 3D


%Methode 1 : 
%Calcule du baricentre :

baryx = [   mean(MP2d(1,:));  
            mean(MP2d(2,:));                       %barycentre 2D homogenes
                1           ]; 

baryX = [   mean(MP3d(1,:));  
            mean(MP3d(2,:));                       %barycentre 2D homogenes
            mean(MP3d(3,:));
                1           ]; 

%On retranche les coordonnées du barycentre à chacun des point
MP2dt  = MP2d - baryx ;                            %en 2D
MP3dt  = MP3d - baryX ;                            %en 2D

%On cherche la moyenne des normes :
m2 = mean(vecnorm(MP2dt, 2, 1));
m3 = mean(vecnorm(MP3dt, 2, 1));

%On cherche a normalise les points :
normMP2dt = MP2dt.*(sqrt(2)/m2);
normMP3dt = MP3dt.*(sqrt(3)/m3);
vectnorm = { normMP2dt ; normMP3dt};

m2p = mean(vecnorm(normMP2dt, 2, 1));
m3p = mean(vecnorm(normMP3dt, 2, 1));

%Teste du nouveau barycentre

baryxp = [   mean(normMP2dt(1,:));  
            mean(normMP2dt(2,:));                   %barycentre 2D homogenes
                1           ]; 

baryXp = [   mean(normMP3dt(1,:));  
            mean(normMP3dt(2,:));                   %barycentre 2D homogenes
            mean(normMP3dt(3,:));
                1           ]; 

% Conclusion on obtient bienc ce qui est attendue avec la méthode 1.
%funct_affichage(vectnorm);


%Point d'origine
%cellplan = { MP2d ; MP3d};

%funct_affichage(cellplan);


%Méthode 1 bis : 
%On a déjà le barycentre calculer dans la méthode 1 
%On cherche alpha et t = (tx; ty)
alpha2Dp = sqrt(2) / m2; % Normalization factor for 2D
t = [baryx(1)*(-alpha2Dp); baryx(2)*(-alpha2Dp)]; % Translation vector for 2D
Tp = [alpha2Dp 0 t(1); 
     0   alpha2Dp t(2);
     0     0       1 ];


beta3Dp = sqrt(3) / m3; % Normalization factor for 3D
t = [baryX(1)*(-beta3Dp); baryX(2)*(-beta3Dp) ; baryX(3)*(-beta3Dp)]; % Translation vector for 3D
Up = [beta3Dp 0  0     t(1); 
     0   beta3Dp 0     t(2);
     0     0   beta3Dp t(3);
     0     0     0      1];

norMP2Dp = Tp * MP2d;
norMP3Dp = Up * MP3d;

%Calcule des matrice B et C;
[B,C,D] = funct_B_C_D(norMP2Dp, norMP3Dp);

% Calculer les valeurs propres et les vecteurs propres de D :
[vv,v] = eig(D);
vp = diag(vv); 
%On cherche la valeur propre la + petite => donc le vecteur propres le + petit
[vp_min, idx] = min(vp);
v2 = vv(:,idx);

%On cherche a determiner v1 a partir de v2 soit : 
v1 = -inv(B'*B)*B'*C*v2;


%On peut déterminer Pnorm: 
Pnorm = [v1(1) v1(2) v1(3) v1(4);
         v1(5) v1(6) v1(7) v1(8);
         v2(1) v2(2) v2(3) v1(9)];

%Dénormaliser la solution :

P = inv(Tp)*Pnorm*Up;

MP2verif = P*MP3d;

MPC2D = funct_conv_dim(MP2verif);