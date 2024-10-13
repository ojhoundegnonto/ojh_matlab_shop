function M = odi_ErrorDeri12_3D(x)
% Cette fonction pert de calculer le "Standard Error" selon la formule: e =
% e = (sqrt(e(t+1)^2 + s(t-1)^2))/deta_t; delta_t = 2 
    X = x.*x; 
    M = []; 
    for i = 1:12
        if i == 1
            m = sqrt(X(:,:,i+1) + X(:,:,i+11))./2;
        elseif i == 12
            m = sqrt(X(:,:,i-1) + X(:,:,1))./2;
        else
            m = sqrt(X(:,:,i-1) + X(:,:,i+1))./2;
        end
        M = cat(3,M,m);
    end
end