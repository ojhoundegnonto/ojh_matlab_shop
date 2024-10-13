function Y = odi_2D_StandardError(X)

    %%% redressement de la matrice en une dimension
    a = reshape(X,size(X,1)*size(X,2),1);
    %%% Nombe de grid
    N = numel(find(isnan(a) == 0));
    %%% Output
    Y = nanstd(a)/sqrt(N);
end