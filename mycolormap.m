%MYCOLORMAP Change colormap resolution
% [CMAP]=MYCOLORMAP(MAP,NCL) 
%    Move colormap MAP resolution to NCL points 
% (-: =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= :-)

%  Guillaume MAZE - LPO/LMD - March 2004
%  gmaze@univ-brest.fr 



function [cmap]=mycolormap(map,ncl)


[ic ii]=size(map);

X= linspace(1,ic,ic);
XI=linspace(1,ic,ncl);
cmap=zeros(ncl,3);

for j=1:ii
   c=interp1(X,squeeze(map(:,j))',XI);
   cmap(:,j)=c';
end
