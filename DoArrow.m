function obj = DoArrow(Xdata,Ydata,n,c)
%This function will draw an arrow on the plot by using direct coordinats.
%The inputs are:
%           Xdata = [X1, X2] ==> start and end xaxis coordinats
%           Ydata = [Y1, Y2] ==> start and end yaxis coordinats
%           n     = 1 for one arrow plotting at the end
%                 = 2 for double arrow plotting at the begining and the end
%           c     = for arrow color precision, as plot color propreties
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
Xpixels = ax_per_xdata.*axpos(3) + axpos(1);
Ypixels = ax_per_ydata.*axpos(4) + axpos(2);
    if (n == 1)
        obj = annotation('arrow', Xpixels, Ypixels);
        obj.Color = c;
    elseif (n == 2)
        obj = annotation('doublearrow', Xpixels, Ypixels);
        obj.Color = c;
    end
end