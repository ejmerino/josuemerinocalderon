%Programa para graficar una funcion paramátrica conocido los
%extremos del intervalo [a, b] al que pertenece t y el numero
%de puntos a utilizar n.
function parametrica(a,b,n)
% parametrica(0,2*pi,1000)
t=linspace(a,b,n);%Permite iniciar a la variable con a, terminar con b
                   % y utilizar n puntos
x=cos(t)./(1+(sin(t)).^2);
y=(sin(t).*cos(t))./(1+(sin(t)).^2);
plot(x,y); % Grafica las variables dadas
xlabel('cos(t)/(1+(sin(t))^2), Eje X');
ylabel('(sin(t)*cos(t))/(1+(sin(t))^2), Eje Y');
title('Funcion parametrica');
grid on
end 