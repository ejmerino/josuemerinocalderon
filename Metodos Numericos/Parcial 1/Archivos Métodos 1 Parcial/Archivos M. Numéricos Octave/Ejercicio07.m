%Graficar y presentar varios gráficos en diferentes
%subpantallas
%linspace(desde, hasta, numero_de_puntos), otra forma
%para expresar un vector y graficar
x=linspace(-2*pi,2*pi,1001);
f=cos(x);
df=-sin(x);
%Funcion subplot (filas, columnas, posición)
%que permite incluir varios graficos en 1 figura
subplot(3,2,1)
plot(x, f,'r');
hold on;
plot(x, df, 'g')
grid on
title('Funcion coseno y su derivada');
%Grafico de una funcion esxponencial
y1=(exp(-x))%.*(x<-1)+(x-3).*((-1<=x)&(x<=1))+(x.^2-1).*(x>1);
subplot(3,2,2)
plot(x, y1, 'r')
grid on
title('Funcion exponencial');
y2=exp(-x);
y3=-exp(-x);
subplot(3,2,3)
plot(x, y2,'b',x, y3, 'g')
grid on
title('Funcion exponencial y su derivada');
y4=2*x.^2+3*x - 4;
subplot(3,2,4)
plot(x, y4, 'y')
grid on
title('Funcion cuadratica');
y6 = log(x) + 1;
y7=log10(x)+1;
subplot(3,2,5)
plot(x, y6)
hold on;
plot(x, y7)
grid on
title('Funcion cuadratica y su derivada')
