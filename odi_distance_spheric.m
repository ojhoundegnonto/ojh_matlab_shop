function DA = odi_distance_spheric(lon1,lat1,lon2,lat2)
% Cette fonction permet de calculer la distance entre deux points A(x1,y1) 
% et B(x2,y2) dans une base de coordonnées sphérique, avec origine: lon = 0° et lat = 0°.  
% Exempl: A(1,1) & B(2,2)
%         AB = odi_distance_spheric(1,1,2,2)
%            = 157.40 km
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                              odilon.houndegnonto@gmail.com (personal mail)
% LOPS/CNRS - IRD le 16 mars 2022 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%
    R = 6378.137; % rayon cnventionnel de la terre en km
    %%% Calcul de la distance angulaire en radian: DA
    %%%% Première opération
    DA_sin = sin(lat1.*pi/180).*sin(lat2.*pi/180);
    %%%% Deuxième opération
    DA_cos = cos(lat1.*pi/180).*cos(lat2.*pi/180).*cos((lon2-lon1).*pi/180);
    %%% DA
    DA = acos(DA_sin + DA_cos);
    DA = DA.*R;
end