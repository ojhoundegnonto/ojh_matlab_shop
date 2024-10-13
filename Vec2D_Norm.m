function D = Vec2D_Norm(x,y)
% Cette fonction permet de calculer la norme d'un vecteur U(x,y) dans une 
% base cartésienne orthonormée. Les variables d'entrées sont les corrdonnées
% du vecteur visé projeté dans la base catésienne.
% Exempl: A(1,1) & B(2,2)
%         AB(x,y) = distance(1,1,2,2)
%                 = 1.41
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                                     nolido2003@gmail.com (personal mail)
% LOPS/UBO - IRD le 28 août 2019 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%
    
    %%% Calcul de la composante suivant l'axe des longitudes (cas océan)
    X_component = x.*x;
    %%% Calcul de la composante suivant l'axe des latitudes (cas océan)
    Y_component = y.*y;
    %%% la valeure de la norme excomptée.
    D = sqrt(X_component + Y_component);
end