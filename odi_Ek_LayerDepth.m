function D = odi_Ek_LayerDepth(lat,Av)
% Cette fonction permet de calculer la profondeur de la couche d'Ekman
%   Inout : lat ==> latitude
%           Av  ==> eddy viscosity
%   Output: D   ==> la profondeur la couche d'Ekman
% By Odilon Joël HOUNDEGNONT, PhD student at LOPS/IDR-MOPGA, Brest France
% E-mail: odilon.houndegnonto@gmail.com

%%%%%%%%%%%%%%%%%%%%%%%%%%% - CALCUL - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        omega = 0.0000727;% vitesse angulaire de rotation de la terre
        f = sind(lat).*omega*2;% paramètre de coriolis
        F = (f).^(-1); %% inverse de f
%-------------------------------------------------------------------------%
        D = sqrt(2*Av*abs(F));% la profondeur de la couche d'Ekman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end