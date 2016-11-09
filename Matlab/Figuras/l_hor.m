function []=l_hor()
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);
end