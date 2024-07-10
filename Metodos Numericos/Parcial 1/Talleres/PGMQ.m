t=linspace(0, 2*pi, 100);
x=1+sin(t);
y=1-sin(t).*cos(t);
figure
plot(x,y,'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
title('Función Paramétrica');