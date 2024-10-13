function N = odi_N2T(ALPHA,TEMP,dZ)
% Cette fonction permet de clculer la contribution de la Température par
% rapport à la fréquence de Brunt Vaïsala (N2)
% INPUT : ALPHA == thermal expension coefficient (matrice)
%         TEMP == Température potentielle (matrice) [°C]
%         dZ == Dérivé de Z (profondeur), dZ = -1, A péciser si différent
%         de: 1-m (scalaire singleton)
% OUTPUT: N^2T
% Autor: Odilon Joël HOUNDEGNONTO
%      : LOPS/IRD, university of Brest, France
%      : odilon.houndegnonto@univ-brest.fr
    g = 9.7963;% Gravitational acceleration
    %%% Dérivé de Z (profondeur)
    %dZ = -1;%% A péciser si différent de: 1-m
    %%% Gradient de la Temperature en fonction de la profondeur.
    gradT = diff(TEMP,1,1);
%     gradT = diff(TEMP(1:length(Alpha(:,1)),:),1,1);
%     gradT = gradient()
    %%% N2T
    N = g.*ALPHA(1:end-1,:).*gradT./dZ;
    clear g gradT dZ
end