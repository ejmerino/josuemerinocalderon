% Grafico de una funcion evaluada en un intervalo
x=1:0.1:8;
f=3*x.^2-4*x+7;
%f=exp(-x/2).*sinh(x).*(1+exp(-x)/4.*(2*cosh(x)-sinh(x)).^2).^0.5;
A=[x' f']
plot(x,f);%Grafica puntos coordenados
grid on;
