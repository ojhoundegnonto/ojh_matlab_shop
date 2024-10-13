function [X, Y] = xy_2D_Reperage(A,I)
% Cette fonction permet de récupérer les indice d'une recherche de position
% d'une valeur de paramètre dans une matrice 2D. En effet ce type de
% recherche d'indice, le resultat, n'indique pas directement la précision 
% sur la ligne et la colonne de la valeur du paramètre visé. C'est le rôle 
% de cette foncion. Ainsi, comme variable
% Entrée: A => représente les indices récupérés après exécution de la
%              première opération de recherche d'indice
%         I => représente le nombre de lingnes de la matrice 2D de la
%              première opération
% Sortie: X => contient les indices en numéro de ligne recherché
%         Y => contient les indices en numéro de colonne recherché
% Auteur: Odilon Joël HOUNDEGNONTO - nolido2003@gmail.com
%                                  - odilon.houndegnonto@univ-brest.fr
%                                  - PhD student at LOPS/Brest-France
%--------------------------------------------------------------------------

    X = []; Y = [];
    for k = 1:length(A)
        if mod(A(k),I) == 0
        x = I;
        y = A(k)/I;
        else
        x = mod(A(k),I);
        y =  fix(A(k)/I) + 1;
        end
    X = cat(1,X,x);
    Y = cat(1,Y,y);
    clear x y
    end
end
