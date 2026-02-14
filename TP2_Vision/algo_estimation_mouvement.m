function [x] = algo_estimation_mouvement(img,img_next,alpha,nb_iter)
    

    [M, N] = size(img);



    x=img_bruit;



    [h,l] = size(img);
    for i=1:nb_iter
        for j=2:(h-1)
            for k=2:(l-1)
                delta1 = ((1+4*alpha)*x(j,k)-alpha*x(j+1,k)-alpha*x(j-1,k)-alpha*x(j,k-1)-alpha*x(j,k+1));
                delta=(1/(1+4*alpha))*(img_bruit(j,k)-delta1);
                x(j,k) = x(j,k)+delta;
            end
        end
    end
end