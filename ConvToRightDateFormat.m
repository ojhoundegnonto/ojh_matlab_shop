function D = ConvToRightDateFormat(X)
% cette fonction permet de convertir les dates de format YYYMMJJ (YYY = an;
% MM = mois et JJ = jour) au format matricielle [YYY MM JJ]. Sur base de
% cette propriété de cette fonction, la viable d'entrée X doit à dimension
% 1D, soit n*1.
% LOPS/UBO - IDR; le 21/12/2018: ----------------- Odilon Joël HOUNDEGNONTO
% Contact: ----------------------------------------------------------------
% ----------------e_mail: nolido2003@gmail.com (personnel) ----------------
% ----------------------: odilon.houndegnonto@univ-brest.fr (professionnel)
% -------------------------------------------------------------------------

% Exemple: X = [20181221; 20181222]
%          Y = ConvToRightDateFormat(X)
%            = [2018 12 21; 2018 12 22]
% -------------------------------------------------------------------------
    if min(size(X))~= 1
% -------------------------------------------------------------------------
disp('Erreur sur la dimension de la variable d''entrée. Assurez-vous qu''elle soit à 1D!')
% -------------------------------------------------------------------------
    else
% -------------------------------------------------------------------------
    a = fix(X./10000); % Pour obtension de l'année
% -------------------------------------------------------------------------
    b = fix(X - a.*10000)/100;% Pour obtension du mois
% -------------------------------------------------------------------------
    c = fix(X - a.*10000 -b.*100);% Pour l'obtension du jour
% -------------------------------------------------------------------------    
    D = [a, b, c]; % Pour obtension de la matrice de sortie
    end
% -------------------------------------------------------------------------
end