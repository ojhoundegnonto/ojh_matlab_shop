function [XpArrow, YpArrow] = dataArrow(Xdata,Ydata)
%This function will normalize direct coordinats onto plot configurations.
%It convert direct coordinats to Arrow plotting coodinats
%The inputs are:
%           Xdata = [X1, X2] ==> start and end xaxis coordinats
%           Ydata = [Y1, Y2] ==> start and end yaxis coordinats
% %-----------------------------------------------------------------------%
% Odilon Joël HOUNDEGNONTO - contact: odilon.houndegnonto@univ-brest.fr
%                                                  or
%                                     nolido2003@gmail.com (personal mail)
% LOPS/UBO - IRD le 06 août 2019 :----------------------- Plouzané (France)
% %-----------------------------------------------------------------------%
% %% THIS FUNCTION IS INSPIRED FROM PROPOSED SOLUTIONS ON MATLAB Answer  %%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ax = gca;
oldunits = get(ax, 'Units');
set(ax, 'Units', 'Normalized');
axpos = get(ax, 'Position');
set(ax, 'Units', oldunits);
%get axes drawing area in data units
ax_xlim = xlim(ax);
ax_ylim = ylim(ax);
ax_per_xdata = abs(Xdata - ax_xlim(1))./ diff(ax_xlim);
ax_per_ydata = abs(Ydata - ax_ylim(1))./ diff(ax_ylim);
%these are figure-relative
XpArrow = ax_per_xdata.*axpos(3) + axpos(1);
YpArrow = ax_per_ydata.*axpos(4) + axpos(2);
end