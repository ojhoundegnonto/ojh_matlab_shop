function N = odi_N2S(BETA,PSAL,dZ)
% Cette fonction permet de clculer la contribution de la Température par
% rapport à la fréquence de Brunt Vaïsala (N2)
% INPUT : BETA == salinity contraction coefficient (matrice)
%         PSAL == salinity (matrice)[PSU]
%         dZ == Dérivé de Z (profondeur), dZ = -1, A péciser si différent
%         de: 1-m (scalaire singleton)
% OUTPUT: N^2S
% Autor: Odilon Joël HOUNDEGNONTO
%      : LOPS/IRD, university of Brest, France
%      : odilon.houndegnonto@univ-brest.fr
    g = 9.7963;% Gravitational acceleration
    %%% Dérivé de Z (profondeur)
    %dZ = -1;%% A péciser si différent de: 1-m
    %%% Gradient de la Temperature en fonction de la profondeur.
    gradPSAL = diff(PSAL,1,1);
%     gradT = diff(TEMP(1:length(Alpha(:,1)),:),1,1);
%     gradT = gradient()
    %%% N2T
    N = -g.*BETA(1:end-1,:).*gradPSAL./dZ;
    clear g gradT dZ
end