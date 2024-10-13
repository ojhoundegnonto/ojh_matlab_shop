function plotXX (varargin)
%
% fonction idem a plotYY mais XX...
%

% création              : 21 octobre 2010
% auteur                : jean-pierre Lefebvre
% dernière modification : 18 octobre 2011

ligne(1).color     = 'b'      ;
ligne(2).color     = 'r'      ;
ligne(1).style     = '-'      ;
ligne(2).style     = '-'      ;
ligne(1).lineWidth = 1        ;
ligne(2).lineWidth = 1        ;

ligne(1).marker = 'none'    ;
ligne(2).marker = 'none'    ;

titre        = []   ;
firstXLabel  = []   ;
secondXLabel = []   ;
leftYLabel   = []   ;
rightYLabel  = []   ;
firstXLim    = []   ;
secondXLim   = []   ;
YLim         = []   ;
firstXScale  = []   ;
secondXScale = []   ;

leftYDir     = 'normal' ;
rightYDir    = 'normal' ;
rightTick    = 1        ;

if iscell(varargin{1}),varargin = varargin{1}; end

x1          = varargin{1}   ;
varargin(1) = []            ;
y1          = varargin{1}   ;
varargin(1) = []            ;
if ischar(varargin{1})
    ligne(1) = decodeLineStyle(varargin{1},ligne(1));
    varargin(1) = []        ;
end

x2          = varargin{1}   ;
varargin(1) = []            ;
y2          = varargin{1}   ;
varargin(1) = []            ;
sameY       = 0             ;

if (length(y1) == length(y2))
     if (y1 == y2)
         sameY  = 1                                                         ;  
         hScale = [floor(min(min(y1),min(y2))) ceil(max(max(y1),max(y2)))]  ;
     end
end


k = find(strcmp(varargin,'title'));
if ~isempty(k)
    titre           = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'rightTick'));
if ~isempty(k)
    rightTick       = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'firstXLabel'));
if ~isempty(k)
    firstXLabel     = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'secondXLabel'));
if ~isempty(k)
    secondXLabel      = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'firstXScale'))    ;
if ~isempty(k)
    firstXScale     = lower(varargin{k+1})  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'secondXScale'))    ;
if ~isempty(k)
    secondXScale    = lower(varargin{k+1})  ;
    varargin(k:k+1) = []             ;
end

k = find(strcmp(varargin,'leftYLabel'));
if ~isempty(k)
    leftYLabel      = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'rightYLabel'));
if ~isempty(k)
    rightYLabel     = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'firstXLim'));
if ~isempty(k)
    firstXLim       = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'secondXLim'));
if ~isempty(k)
    secondXLim     = varargin{k+1}     ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'leftYDir'));
if ~isempty(k)
    leftYDir        = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'rightYDir'));
if ~isempty(k)
    rightYDir       = varargin{k+1}  ;
    varargin(k:k+1) = []             ;
end
k = find(strcmp(varargin,'YLim'));
if ~isempty(k)
    YLim            = sort(varargin{k+1})   ;
    varargin(k:k+1) = []                    ;
end
k = find(strcmp(varargin,'BlacknWhite'));
if ~isempty(k)
    ligne(1).color     = [0.4 0.4 0.4]     ;
    ligne(1).style     = '--'              ;
    ligne(2).color     = 'k'               ;
    ligne(2).lineWidth = 1.5               ; 
    varargin(k)        = []                ;
end


if ~isempty(varargin)
    if ischar(varargin{1})
        ligne(2) = decodeLineStyle(varargin{1},ligne(2));
        varargin(1) = []        ;
    end
end

hl1 = line(x1,y1,'Color',ligne(1).color,'LineStyle',ligne(1).style,'Marker',ligne(1).marker,'lineWidth',ligne(1).lineWidth)     ;
ax1 = gca                               ;
if sameY
    set(ax1,'XColor',ligne(1).color,'YColor','k','YLim',hScale);
    ax2 = axes('Position',get(ax1,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor',ligne(2).color,'YColor','k');
    set(ax2,'YLim',hScale);
else
    set(ax1,'XColor',ligne(1).color,'YColor',ligne(1).color);
    ax2 = axes('Position',get(ax1,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor',ligne(2).color,'YColor',ligne(2).color);
end

set(ax1,'YDir',leftYDir)    ;
set(ax2,'YDir',rightYDir)   ;

hl2 = line(x2,y2,'Color',ligne(2).color,'LineStyle',ligne(2).style,'Marker',ligne(2).marker,'lineWidth',ligne(2).lineWidth,'Parent',ax2);

if ~isempty(firstXLim),     set(ax1,'XLim',firstXLim) ; end
if ~isempty(YLim)     
    set(ax1,'YLim',YLim) ; 
    set(ax2,'YLim',YLim) ;
end
if ~isempty(secondXLim),    set(ax2,'XLim',secondXLim); end
if ~isempty(leftYLabel),   set(get(ax1,'YLabel'),'string',leftYLabel)  ; end
if ~isempty(rightYLabel),  set(get(ax2,'YLabel'),'string',rightYLabel) ; end
if ~isempty(firstXLabel),  set(get(ax1,'XLabel'),'string',firstXLabel) ; end
if ~isempty(secondXLabel), set(get(ax2,'XLabel'),'string',secondXLabel); end
if ~isempty(firstXScale),  set(ax1,'XScale',firstXScale) ; end
if ~isempty(secondXScale), set(ax2,'XScale',secondXScale); end
if ~(rightTick), set(ax2,'YTick',[]); end
if ~isempty(titre),   title(titre)  ; end
end

function ligne = decodeLineStyle (style,ligne)

couleur = {'y','m','c','r','g','b','w','k'} ;
for ii=1:length(couleur)
    if ~isempty(findstr(style,couleur{ii})), ligne.color = couleur{ii} ; end
end
linestyle = {'-', '--',':','-.'}    ;
for ii=1:length(ligne)
    if ~isempty(findstr(style,linestyle{ii})), ligne.style = linestyle{ii} ; end
end
marker = {'+','o','*','.','x','s','d','^','v','>','<','p','h'};
for ii=1:length(marker)
    if ~isempty(findstr(style,marker{ii})), ligne.marker = marker{ii} ; end
end
end