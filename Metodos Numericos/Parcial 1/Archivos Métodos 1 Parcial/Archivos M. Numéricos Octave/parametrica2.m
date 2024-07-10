%Funcion param�trica en la que R, r, a y b y el n�mero de puntos
%a utilizar son par�metros de entrada
function parametrica2(R,r,a,b,n)
%parametrica2(5,0.5,-20,20,1000)
t= linspace(a,b,n);
x=(R+r)*cos(t)-r*cos((R+r)*t/r);
y=(R+r)*sin(t)-r*sin((R+r)*t/r);
plot(x,y)
xlabel('Eje X, x = (R+r)*cos(t)-r*cos((R+r)*t/r)')
ylabel('Eje Y, y = (R+r)*sin(t)-r*sin((R+r)*t/r)')
title('Funcion parametrica ')
grid on
