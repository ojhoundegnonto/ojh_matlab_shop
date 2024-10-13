function K = odi_Eddy_viscosity(lat,u,v)
% Cette fonction permet de calculer le coefficeint de viscosité turbulent dû à la friction du vent
%   Inout : lat ==> latitude
%           u   ==> eastward wind stress
%           v   ==> northward wind stress
%   Output: K   ==> Eddy viscosity
% By Odilon Joël HOUNDEGNONT, PhD student at LOPS/IDR-MOPGA, Brest France
% E-mail: odilon.houndegnonto@gmail.com
% The formular is token from Chu, 2015 (36c, pg. 12): for K formular
% Citation form: Chu, Peter C. (2015). Ekman Spiral in a Horizontally Inhomogeneous 
%                Ocean with Varying Eddy Viscosity. Pure and Applied Geophysics, 172(10),
%                2831–2857. doi:10.1007/s00024-015-1063-4 
% Simple friction velocity formular: from Klinger et al 2006
% Citation form: Klinger, B. A., Huang, B., Kirtman, B., Schopf, P., & Wang, J. (2006). Monthly 
%                Climatologies of Oceanic Friction Velocity Cubed. Journal of Climate, 19(21), 
%                 5700–5708. https://doi.org/10.1175/JCLI3863.1

%%%%%%%%%%%%%%%%%%%%%%%%%%% - CALCUL - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        omega = 0.0000727;% vitesse angulaire de rotation de la terre
        f = sind(lat).*omega*2;% paramètre de coriolis
        F = (f).^(-1); %% inverse de f
        u_square = u.*u + v.*v;% the square of wind stress
        rho = 1025; % ocean density
        u_star = sqrt(u_square)./rho;% frictional velocity
%-------------------------------------------------------------------------%
        K = 0.004*u_star.*abs(F);% la profondeur de la couche d'Ekman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end