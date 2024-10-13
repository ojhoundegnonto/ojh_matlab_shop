function id = closepoint(X,Y)
% Cette fonction permet de récupérer les indices des point de matrices X et
% Y qui sont très proches les uns des autres ou égaux. X et Y doivent être
% des matrices à 1D. la variable de sortie "id" est de la taille de Y, car 
% la recherche de rapprochement de point est orientée vers la variable Y.           
% Auteur: Odilon Joël HOUNDEGNONTO 
% Contact auteur: -------------------------------- Odilon Joël HOUNDEGNONTO
% ----------------------- odilon.houndegnonto@univ-brest.fr (professionnel)
%                  ou     nolido2003@gmail.com   -----------(personal mail)
% LOPS/UBO-IUEM - IRD (2019) - Plouzané (France) --------------------------
% %-----------------------------------------------------------------------%

%--------------------------------------------------------------------------
id = [];
%--------------------------------------------------------------------------
    for i = 1:length(Y)
        A = X - Y(i);
        B = abs(A);
        j = find(B == min(B));
        %-----------------------------
        % Filtre de sélection d'indice
        if max(size(j))>1
%             C = X(j) - Y(i);
%             k = find(C == min(C));
            j_use = min(j);
        else
            j_use = j;
        end
        %-----------------------------
        % Récupération de l'indice
        id = cat(1,id,j_use);
        %-----------------------------
        % Effacement de memoire
        clear A B C j k j_use     
    end
    clear i
end
