%Grafico de una funcion ingresando los datos del intervalo
a=input('Ingrese a:');
b=input('Ingrese b:');
h=input('Ingrese h:');
x=a:h:b;
f=tan(x.^2+2).*sin(x);
%f=x.*sin(x)+1
A=[x' f']
plot(x,f,'b');
grid on;
