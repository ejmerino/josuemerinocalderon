% Definir el rango del parámetro t
t = 0:0.1:10;

% Calcular x y y para cada t
x = t .* cos(t);
y = t .* sin(t);

% Graficar la función paramétrica
figure;
plot(x, y);
title('Gráfica de la espiral de Arquitas');
xlabel('x(t)');
ylabel('y(t)');
grid on;
