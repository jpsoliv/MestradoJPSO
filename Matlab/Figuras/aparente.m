function [P,Q,S] = aparente(t,V,I,flag)

Va = V(:,1);
Vb = V(:,2);
Vc = V(:,3);

Ia = I(:,1);
Ib = I(:,2);
Ic = I(:,3);

%% Transformada de Clarke

Valpha = sqrt(2/3)*(1*Va - 1/2*Vb - 1/2*Vc);
Vbeta = sqrt(2/3)*(0*Va + sqrt(3)/2*Vb - sqrt(3)/2*Vc);

Ialpha = sqrt(2/3)*(1*Ia - 1/2*Ib - 1/2*Ic);
Ibeta = sqrt(2/3)*(0*Ia + sqrt(3)/2*Ib - sqrt(3)/2*Ic);

%% P-Q theory

P = Valpha.*Ialpha + Vbeta.*Ibeta;
Q = Vbeta.*Ialpha - Valpha.*Ibeta;

S = sqrt(P.^2+Q.^2);

if strcmp(flag,'filt')
    f = 40*40;
    Ts = 1e-7;
    % fsample = 1/2e-7;
    fsample = 1/Ts;

    [b,a] = butter(2,f/(fsample/2),'low');

    P = filter(b,a,P);
    Q = filter(b,a,Q);
    S = sqrt(P.^2+Q.^2);
end

plot(t,S,t,P,t,Q);legend('S','P','Q')
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);
