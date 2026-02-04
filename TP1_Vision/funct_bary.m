function [baryx,baryX] = funct_bary(MP2,MP3)
    %Calcule du baricentre :

    baryx = [   mean(MP2(1,:));  
                mean(MP2(2,:));                       %barycentre 2D homogenes
                    1           ]; 
    
    baryX = [   mean(MP3(1,:));  
                mean(MP3(2,:));                       %barycentre 3D homogenes
                mean(MP3(3,:));
                    1           ]; 
end