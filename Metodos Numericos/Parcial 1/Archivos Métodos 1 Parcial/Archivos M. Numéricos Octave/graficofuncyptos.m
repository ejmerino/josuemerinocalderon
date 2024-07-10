m=[2 5 4 6 8]; %(2,8);(5,15),(4,12),....
n=[8 15 12 24 21];
x=2:0.1:8;
y1=5.4914+2.2845*x;
y2=-4.2313+7.056*x-0.4739*x.^2;
y3=exp(1.99010+0.1539*x);
plot(x,y1,x,y2,x,y3,m,n,'or')
grid on
xlabel('Eje X');
ylabel('Eje Y');
legend('Funcion Lineal','Funcion Cuadratica','Funcion Exponencial','Puntos m y n','Puntos Coordenados(nodos)','Location','northwest')