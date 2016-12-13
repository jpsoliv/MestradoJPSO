function tensaocorrente(V,I,t)

% title('Tensão e Corrente no PCC')
% plot(t,X,t,Iabc.signals.values(index_ini:index_fim));
yyaxis left
plot(t,V(:,1));
ylabel('Tensão [V]');
ylim([-190 190]);
yyaxis right
plot(t,I(:,1));xlabel('tempo[s]');ylabel('Corrente [A]');
ylim([-max(I(:,1))*2 max(I(:,1))*2]);
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);