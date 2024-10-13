function [X_LON,Y_LAT] = lonlat_cartesian(LON,LAT,R)
% Cette fonction permet de convertir les coordonnées LON et LAT (en degré
% décimal) en longueur, en terme de coordonnées cartésiennes. LON et LAT
% représentent respectivement: longitude et latitude, tandis que R est le
% rayon de la terre utilisé pour la conversion (R ~ 6400-km). En fonction
% de la précision voulu, ce rayon être bien choisi et utilisé en tant que
% paramètre d'entrée de la fonction lonlat_cartesian.
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                                     nolido2003@gmail.com (personal mail)
% LOPS/UBO - IRD le 05 août 2019 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%
    
    % Convertion de longitude (°) en longitude distance (unité de R)
    X_LON = R*(LON.*pi/180).*cos(LAT.*pi/180);
    % Convertion de latitude (°) en latitude distance (unité de R)
    Y_LAT = R*(LAT.*pi/180);
end