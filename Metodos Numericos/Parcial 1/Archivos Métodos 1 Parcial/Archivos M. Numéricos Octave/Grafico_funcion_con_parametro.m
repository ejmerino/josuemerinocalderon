% Grafico de una funcion con parametro a
x=-5:0.01:5;
for a=-100:10:100
y1=cosh(-x)-sin(-x)+a;
pause(2)
hold on;
plot(x,y1);
end
grid on