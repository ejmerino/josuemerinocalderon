% Grafico de la funcion coseno y de su
%derivada en el mismo plano coordenado
x=-2*pi:pi/36:2*pi;
y1=cos(x); %Funcion inicial y1=cos(x)
plot(x,y1,'r')
hold on
pause(4)
y2=-sin(x);% Derivada de la funcion y1 = cos(x); y2=-sen(x)
plot(x,y2,'b')
xlabel('x en radianes')
ylabel('cos(x), - sen(x)')
title('Grafica del cos(x) y de su derivada')
hold off
grid on
