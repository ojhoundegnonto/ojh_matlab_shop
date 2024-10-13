function ANGLE = Angle42Vector(u1,v1,u2,v2,n)
% Cette fonction permet de calculer l'angle entre deux vecteur dans une
% base cartésienne. Les calculs inclus dans cette, suivent les normes
% adaptées dans uns repère cartésien. L'unité de la vairable de sortie est
% soit en degré (°)    ===> n = 1
%      en radian (rad) ===> n = 2
% Les variables d'entrée u1, v1, u2 et v2, représentent les coordonnées des
% vecteur U(u1,v1) et V(u2,V2) pour lesquels l'angle de déviation est
% calculé. Notez que U et V sont définis dans une repère plan à 2D.
% Exemple: U(1,1) et V(1,0)
%          Z = Anlge42Vector(1,1,1,0,1)
%            = 45° (angle entre U et V)
%          ----------------------------
%          T = Anlge42Vector(1,1,1,0,2)
%            = 0.79 rad (pi/4)
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                                     nolido2003@gmail.com (personal mail)
% LOPS/UBO - IRD le 31 août 2019 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%



%%% Produit scalaire des vecteurs
    VecScla = u1.*u2 + v1.*v2;
%%% Proatuint des nromes des vecteurs vitesse
    PNorme = sqrt(u1.*u1 + v1.*v1).*sqrt(u2.*u2 + v2.*v2);
%%% Calcul de l'angle
    if (n == 1)
        ANGLE = acosd(VecScla./PNorme);
    elseif (n == 2)
        ANGLE = acos(VecScla./PNorme);
    else
        error('Error in angle unit choice. Please, use "n = 1", for angle in degree or "n = 2", for angle in radian')
    end
end