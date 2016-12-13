function tensaocorrente(V,I,t)

ftaxes = 24;
% title('Tensão e Corrente no PCC')
% plot(t,X,t,Iabc.signals.values(index_ini:index_fim));
yyaxis left
plot(t,V(:,1));
% ylim([-190 190]);
% yl = ylabel('Tens\~ao [V]');
% set(yl,'Interpreter','latex');
% set(yl,'FontName','Times New Roman');
% % set(yl,'FontAngle','italic');
% set(yl,'FontSize',ftaxes);
% 
yyaxis right
plot(t,I(:,1));
% ylim([-max(I(:,1))*2 max(I(:,1))*2]);
% yl = ylabel('Corrente [A]');
% set(yl,'Interpreter','latex');
% set(yl,'FontName','Times New Roman');
% % set(yl,'FontAngle','italic');
% set(yl,'FontSize',ftaxes);

% xl = xlabel('tempo [s]');
% set(xl,'Interpreter','latex');
% set(xl,'FontName','Times New Roman');
% % set(yl,'FontAngle','italic');
% set(xl,'FontSize',ftaxes);

v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);