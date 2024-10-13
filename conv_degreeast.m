function Y = conv_degreeast(X)
% Cette permet de convertir les données de longitudes orientées vers l'Est:
% 0° à 360° et même plus. Les données de coordonnées Longitude OSCAR et
% GPCP (et autres) pourront facilement être converties avec cette foction.
% -------------------------------------------------------------------------
% Exemple 1: X = 420° => Y = conv_degreeast(X)
%                     => Y = 60
%                     => Y = 60°E
% -------------------------------------------------------------------------
% Exemple 2: X = 230° => Y = conv_degreeast(Y)
%                     => Y = -130
%                     => Y = 130°W
% ------------------------------------------------------------------------
% Contact: -------------------------------------- Odilon Joël HOUNDEGNONTO
% ----------------e_mail: nolido2003@gmail.com (personnel)
% ----------------------: odilon.houndegnonto@univ-brest.fr (professionnel)
% -------------------------------------------------------------------------

    i = find(X>180);
    k = X(i) - 360;
    X(i) = k;
    Y = X; clear i k 
end
