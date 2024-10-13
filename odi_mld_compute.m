function D = odi_mld_compute(S,T,P,LON,LAT,n)
% D = odi_mld_compute(S,T,P,LON,LAT) is a function to comput MLD
% This function allows to calculate the Mixed Layer Depth (MLD, im meter)
% without reference depth, based on a criterion of Brun Vaïsälä
% frequency. Its method is based on the de Boyer Montégu et al., 2004, but
% is free of reference depth constraint. The criterion used allows estimating 
% the MLD regarding the thermohaline stratification of the water column, through
% the buoyancy frequency of water particle. The function works with The Gibbs 
% SeaWater (GSW) Oceanographic Toolbox of TEOS-10 (https://www.teos-10.org).
% User should install the GSW TEOS-10 toolbox in the MATLAB path or add path
% toward the concern toolbox. 
% -------------------------------------------------------------------------
% /!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\
% -------------------------------------------------------------------------
% There is a temporary embargo on the used of this function based on the 
% establish method untill its publication.
% Author: Dr. Odilon Joël Houndegnonto
% E-mail: odilon.houndegnonto@gmail.com
% Web: https://ojhoundegnonto.github.io
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%       S: ocean salinity profil (pss)
%       T: ocean in situ temperature profil (°C)
%       P: ocean pressure or depth profil (dbar or meter)
% S, T and P should have the dimention: NxM where N represents the vertical
% dimension -- depth dimention -- (number of line) and M represents the
% horizontal dimension -- station dimention -- (number of columns). So N
% can not be equal to one (01) but M, yes!
%       LON: longitude (1xM), should be a vector
%       LAT: latitude (1xM), should be a vector
%       n  : specify if T is in situ temperature (IT) or Potential
%       temperature (PT)
% Output:
%       D: Mixed Layer depth (m), with a size of 1xM
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% Check variables and resize if necessary
%--------------------------------------------------------------------------
    if ~(nargin==6)
        error('odi_mld_compute:  Requires six inputs')
    end
%--------------------------------------------------------------------------
    [Sx,Sy] = size(S);[Tx,Ty] = size(T);
    [Px,Py] = size(P);[Lx,Ly ]= size(LON);[lx,ly] = size(LAT);
    %%% N value verification
    if (Sx == 1 || Tx ==1 || Px == 1)
        error('odi_mld_compute: Inputs array dimensions arguments do not agree => Vercial level size of S, T and P have to be more than one (01)') 
    end
    %%% N match verification
    if ~(Sx == Tx && Sx == Px && Tx == Px)
        error('odi_mld_compute: Inputs array dimensions arguments do not agree => S, T and P should have the same dimension') 
    end
    %%% M match verification
    if ~(Sy == Ty && Sy == Py && Ty == Py)
        error('odi_mld_compute: Inputs array dimensions arguments do not agree => S, T and P should have the same dimension') 
    end
    %%% LON and LAT dimentions verification
    if (Lx == 1) && (Ly == 1) % LON is a scalor
        LON = LON*ones(1,Sy);
    elseif (Lx ~= 1) && (Ly == 1) % LON is a arraw
        LON = LON.';
    end
    if (lx == 1) && (ly == 1) % LAT is a scalor
        LAT = LAT*ones(1,Sy);
    elseif (lx ~= 1) && (ly == 1) % LAT is a arraw
        LAT = LAT.';
    end
    for i = 1:Sy
    % Compute Absolute Salinity: SA(in g/kg)
        SA = gsw_SA_from_SP(S(:,i),P(:,i),LON(i),LAT(i));
        if (n == 'IT')
    % Compute Conservative Temperature: CT(in °C)
            CT = gsw_CT_from_t(SA,T(:,i),P(:,i));
        elseif (n == 'PT')
    % Compute Conservative Temperature: CT(in °C)
            CT = gsw_CT_from_pt(SA,T(:,i));
        end
    % Comput of the Brun Vaïsälä frequency: N² (in s^-2) with corresponded 
    % depth (P_mid, in meter)
        [N2, P_mid] = gsw_Nsquared(SA,CT,P(:,i),LAT(i));
    % Compute MLD starting process
    % %%%%%%% identification of MLD idex
        i_mld = find(N2>=.0003);
        %%%% Instruction exceptionnnel:
        if ~(isempty(i_mld))%%% In the method criteria match
            i_mld = i_mld(1);
            D(1,i) = P_mid(i_mld);
        else                    %%% In the method criteria not match
            %i_mld = NaN(1,1);
            D(1,i) = NaN(1,1);
        end
    % %%%%%%% MLD value
    % filling the matrix
%         if (isfinite(i_mld))
%             D(1,i) = P_mid(i_mld);
%         else
%             D(1,i) = NaN(1,1);
%         end
    end
end