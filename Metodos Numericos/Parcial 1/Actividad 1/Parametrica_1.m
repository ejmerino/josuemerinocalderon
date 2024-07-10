t = 0:0.1:10;
x = t .* cos(t);
y = t .* sin(t);
figure;
plot(x, y);
title('Espiral de Arquitas');
xlabel('x(t)');
ylabel('y(t)');
grid on;
