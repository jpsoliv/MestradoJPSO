function F = capeta(x)
w = 2*pi*400;
alpha = 0.0720;
beta = 0.0266;

F(1) = x(1)*w^2*x(2)^2-alpha*(w^2*x(2)^2+x(1)^2);
F(2) = x(1)^2*w*x(2)-beta*(w^2*x(2)^2+x(1)^2);
F(3) = w*x(2)/x(1)-alpha/beta;