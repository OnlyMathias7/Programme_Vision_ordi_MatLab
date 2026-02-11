clc, clear, close all,

if isfile('points_2D.mat')
    disp('Le fichier existe');
    S = load("points_2D.mat", 'MP2'); 
    MP2 = S.MP2;
else
    disp('Le fichier n''existe pas');
    MP2 = select_calibration_points('mire_px.png', 12);
end

MP3 = [ 0 0 0 0 3 5 7 2 1 5 3 7;
        7 4 6 1 6 8 3 1 0 0 0 0; 
        6 4 2 1 0 0 0 0 5 4 1 2;
        1 1 1 1 1 1 1 1 1 1 1 1];  

data_cell = funct_donnee_test();

% On rajoute plus de points pour faire l'estimation de la matrice
% MP2 = [MP2 data_cell{3}{1} data_cell{4}{1}];
% MP3 = [MP3 data_cell{3}{2} data_cell{4}{2}];

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
% N = size(data_cell,2)-2;
% for i=1:N
%     funct_verification(Pnorm, T, U, data_cell{i}{1}, data_cell{i}{2});
% end

% Verifie avec toutes les données
n = length(data_cell);
test2 = [];
test3 = [];

for i = 1:n
    test2 = [test2, data_cell{i}{1}];
    test3 = [test3, data_cell{i}{2}];
end
funct_verification(Pnorm, T, U, test2, test3);