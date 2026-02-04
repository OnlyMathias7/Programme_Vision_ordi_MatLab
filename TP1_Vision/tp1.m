clc, clear, close all,

% coordonné en image homogenes (2D)
% MP2 = [ 278 150 224 351 456 525 ;
%          116 182 381 439 172 300 ;                 %matrice de points en 2D
%           1   1   1   1   1   1   ];

MP2 = [ 460.4579 428.1211 37.0474 153.2579 259.3632 186.6053 ;
        226.3526 119.2368 98.0158 182.9000 349.6368 418.3526 ;                 %matrice de points en 2D
          1   1   1   1   1   1   ];

MP2new = [ 459 240 329 424 89 227;
           255 168 356  68 93 384;
           1    1   1   1   1   1 
    ];

MP2new2 = [ 264 150 273 312 459 525;
            231 280 333 368 223 300;
             1    1   1   1   1   1 
    ];
% coordonné en espace homogenes (3D)
% MP3 = [ 0 0 4 7 6 4 ;
%          2 5 5 4 0 0 ; 
%          4 3 0 0 1 3 ;
%          1 1 1 1 1 1 ];                            %matrice de points en 3D



MP3 = [ 4 3 0 0 3 5 ;
        0 0 7 5 4 6 ; 
        2 4 5 3 0 0 ;
        1 1 1 1 1 1 ];  

MP3new = [ 4 0 3 2 0 6;
           0 3 4 0 5 4;
           2 3 0 5 6 0;
           1 1 1 1 1 1 ]; 

MP3new2 = [ 0  0 3   5   4 6;
           2.5 5 4.5 3.5 0 0;
           1.5 3 0   0   2 1
           1   1 1   1   1 1 ]; 

%MP2 = [MP2new2];
%MP3 = [MP3new2];

%Méthode de normalisation 2
[MP2norm,MP3norm, T, U] = funct_methode2(MP2,MP3);



%Vérification des matrice U et T : 
MP2verif = T\MP2norm;
MP3verif = U\MP3norm;
%Visualisation des points dans l'espace
vectMP = {MP2,MP3};
vectnorm = {MP2norm, MP3norm};
funct_affichage(vectMP);
funct_affichage(vectnorm);

%Calcule des matrice B et C;
[B,C,D] = funct_B_C_D(MP2norm, MP3norm);

% Calculer les valeurs propres et les vecteurs propres de D :
[vv,v] = eig(D);
vp = diag(v); 
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
funct_verification(Pnorm,T, U, MP2, MP3);

%funct_verification(Pnorm, T, U, MP21, MP31);
