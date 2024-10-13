function y = odi_2Dmean(x)
% fonction de calcul de la moyenne d'une matrice 2D 
    z = reshape(x,numel(x(:,1))*numel(x(1,:)),1);
    y = nanmean(z);
end  
%%
