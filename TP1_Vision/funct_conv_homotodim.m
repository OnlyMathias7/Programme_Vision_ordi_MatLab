function [M] = funct_conv_homotodim(MCH)
    n=size(MCH,1)
    M = zeros(n-1, size(MCH, 2)); % Initialize M with appropriate dimensions
    for i=1:n-1
        M(i,:) = MCH(i,:)./MCH(n,:);
    end
end