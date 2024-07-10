x=linspace(-2,pi/2,1000);
y=exp(-x);
f=sqrt(1+exp(-2*x));
plot(x,y,x,f)%Grafica puntos
grid on
ylabel('Grafica de y=exp(-x),y=sqrt(1+exp(-2*x))')
title('Graficas de la funcion y la integral que representa la longitud de la curva')
legend('y=exp(-x)','f=sqrt(1+exp(-2*x))')
