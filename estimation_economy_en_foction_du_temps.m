%%
t0 = 4000;
Tok = 4000;
for i = 1:16
    Tok = Tok + 650
    Toki(:,i) = Tok;
end
%%
figure
subplot(1,2,1)
plot(1:16,Toki./1000,'-k')
hold on
plot(1:16,Toki./1000,'o','LineWidth',1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','m',...
                       'MarkerSize',7)
hold on
plot(1:16,Toki./1000,'.w')
hold on
plot(1:16,(Toki-2000)./1000,'-.g')

grid on
ylabel('Mille')
title('[Economy en EURO]')
set(gca,'xtick',1:16,'xlim',[0.25 16.75],'ylim',[4 15],'ytick',4:.65:15,'xticklabel',{'APR';'MAY';'JUN';'JUL';'AUG';'SEP';'OCT';'NOV';'DEC';'JAN';'FEB';'MAR'},'Fontsize',10,'fontweight','bold','TickDir','out','ticklen',[0.007 0.005])
subplot(1,2,2)
plot(1:16,(Toki.*655.957)/1000000,'-k')
hold on
plot(1:16,(Toki.*655.957)/1000000,'o','LineWidth',1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','m',...
                       'MarkerSize',7)
hold on
plot(1:16,(Toki.*655.957)/1000000,'.w')

grid on
ylabel('Million')
set(gca,'xtick',1:16,'xlim',[0.25 16.75],'ylim',[2.5 10],'ytick',2:.2:11,'xticklabel',{'APR';'MAY';'JUN';'JUL';'AUG';'SEP';'OCT';'NOV';'DEC';'JAN';'FEB';'MAR'},'Fontsize',10,'fontweight','bold','TickDir','out','ticklen',[0.007 0.005])
title('[Economy en francs CFA]')

