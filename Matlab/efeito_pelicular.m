% AWG 10; diameter 2.5882 mm

Rl = 0.00406;       %ohm/m
d = 2.5882e-3;          %m
A = pi*(d/2)^2;      %m^2
rho = Rl*A;         %ohm*m
% rho = 1.678e-8;

f300 = 300; 
f400 = 400;
f800 = 800;
mu0 = 4*pi*1e-7;
mur = 0.999991;
delta300 = sqrt(rho/(pi*f300*mu0*mur));
delta400 = sqrt(rho/(pi*f400*mu0*mur));
delta800 = sqrt(rho/(pi*f800*mu0*mur));

