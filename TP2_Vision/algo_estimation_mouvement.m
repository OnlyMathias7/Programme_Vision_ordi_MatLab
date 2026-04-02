function [u,v] = algo_estimation_mouvement(img,img_next,lambda,nb_iter)


    %Lecture du déplacement horizontale puis verticale de l'image de référence 
    [Ix, Iy] = gradient(img);
    
    %Déplacement dans le temps (pas de 1 entre les deux photos)
    It = img_next-img;

    [M, N] = size(img);
    u= zeros(M,N);
    v= zeros(M,N);

for k=1:nb_iter    
    for i=2:M-1
        for j=2:N-1
            u_voisin = (u(i+1,j)+u(i-1,j)+u(i,j-1)+u(i,j+1)); 
            v_voisin = (v(i+1,j)+v(i-1,j)+v(i,j-1)+v(i,j+1)); 
            u_bar=u_voisin/4;
            v_bar=v_voisin/4;
            % equation du flot optique
            P=Ix(i,j)*u_bar+Iy(i,j)*v_bar+It(i,j);
            % Evaluation de la distance
            D= Ix(i,j)^2 + Iy(i,j)^2 + 4*lambda;
            % calcul des corrections de U et V
            delt_u=(-Ix(i,j)*P+lambda*(u_voisin-4*u(i,j)))/D;
            delt_v=(-Iy(i,j)*P+lambda*(v_voisin-4*v(i,j)))/D;
            u(i,j)=u(i,j)+delt_u;  
            v(i,j)=v(i,j)+delt_v; 
        end
    end
end

end