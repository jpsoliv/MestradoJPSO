function axesftsize(ftaxes,xlab,ylab,flag)

xl = xlabel(xlab);
set(xl,'Interpreter','latex');
set(xl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

if flag == 1
    
    yyaxis left
    % plot(t,V(:,1));
    % ylim([-190 190]);
    yl = ylabel('Tens\~ao [V]');
    set(yl,'Interpreter','latex');
    set(yl,'FontName','Times New Roman');
    % set(yl,'FontAngle','italic');
    set(yl,'FontSize',ftaxes);

    yyaxis right
    % plot(t,I(:,1));
    % ylim([-max(I(:,1))*2 max(I(:,1))*2]);
    yl = ylabel('Corrente [A]');
    set(yl,'Interpreter','latex');
    set(yl,'FontName','Times New Roman');
    % set(yl,'FontAngle','italic');
    set(yl,'FontSize',ftaxes);
else
    yl = ylabel(ylab);
    set(yl,'Interpreter','latex');
    set(yl,'FontName','Times New Roman');
    % set(yl,'FontAngle','italic');
    set(yl,'FontSize',ftaxes);
end



