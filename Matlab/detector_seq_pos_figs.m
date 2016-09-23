ti = 0;
tf = 70/400;
Ts = 1e-5;

t = linspace(ti,tf,1/Ts);

f=400;

ya = 115*sqrt(2)*sin(2*pi*f*t)+0.1*115*sqrt(2)*sin(2*pi*f*3*t)+0.08*115*sqrt(2)*sin(2*pi*f*11*t)+0.06*115*sqrt(2)*sin(2*pi*f*t*7)+0.08*115*sqrt(2)*sin(2*pi*f*t*17)+0.05*115*sqrt(2)*sin(2*pi*f*t*29);
yb = circshift(ya,[0, round(1/(400*Ts*3))]);
yc = circshift(yb,[0, round(1/(400*Ts*3))]);

y.time = t';
y.signals.values = [ya', yb', yc'];
y.singals.dimensions = 3;

plot(t,y.signals.values);

sim('detector_de_sequencia_positiva','StopTime',num2str(tf));

figure(1);
plot(y.time,y.signals.values(:,1));
figure(2);
plot(Vlinha.time,Vlinha.signals.values(:,1));