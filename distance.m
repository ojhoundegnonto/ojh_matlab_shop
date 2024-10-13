function D = distance(x1,y1,x2,y2)
% Cette fonction permet de calculer la distance entre deux points A(x1,y1) 
% et B(x2,y2) dans une base cartésienne orthonormée, avec origine: lon = 0° et lat = 0°.  
% Toutes les variables d'entrées doivent être de même caractéristiques et 
% projeté (convertir) dans la base catésienne.
% Exempl: A(1,1) & B(2,2)
%         AB = distance(1,1,2,2)
%            = 1.41
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                                     nolido2003@gmail.com (personal mail)
% LOPS/UBO - IRD le 05 août 2019 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%
    
    %%% Calcul de la composante suivant l'axe des longitudes
    X_component = (x1 - x2).^2;
    %%% Calcul de la composante suivant l'axe des latitudes
    Y_component = (y1 - y2).^2;
    %%% la valeure de la distance excomptée.
    D = sqrt(X_component + Y_component);
end