function Y = odi_Error_2D_average(X)

    %%% redressement de la matrice en une dimension
    a = reshape(X,size(X,1)*size(X,2),1);
    %%% Nombe de grid
    N = numel(find(isnan(a) == 0));
    %%% Output
    Y = (sqrt(nansum(abs(a.*a))))/N;
end