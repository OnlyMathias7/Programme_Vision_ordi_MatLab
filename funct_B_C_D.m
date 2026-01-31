function [B,C,D] = funct_B_C_D(PTH2D, PTH3D)
    n = size(PTH2D, 2);
    for i=1:n
        B((2*i)-1,:) = [PTH3D(1,i) PTH3D(2,i) PTH3D(3,i) 1 0 0 0 0 -PTH2D(1,i)];
        B((2*i),:) = [0 0 0 0 PTH3D(1,i) PTH3D(2,i) PTH3D(3,i) 1 -PTH2D(2,i)];

        C((2*i)-1,:) = [-PTH2D(1,i)*PTH3D(1,i) -PTH2D(1,i)*PTH3D(2,i) -PTH2D(1,i)*PTH3D(3,i)];
        C((2*i),:) = [-PTH2D(2,i)*PTH3D(1,i) -PTH2D(2,i)*PTH3D(2,i) -PTH2D(2,i)*PTH3D(3,i)];
    end
    
    D = C'*C-C'*B*inv(B'*B)*B'*C;
end