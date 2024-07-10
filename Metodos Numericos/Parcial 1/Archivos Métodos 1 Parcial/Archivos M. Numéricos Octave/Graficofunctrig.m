x=0:pi/36:4*pi;
y1=sin(x);
y2=sin(2*x);
y3=sin(x/4);
plot(x,y1,x,y2,x,y3)
grid on
xlabel('Eje X');
ylabel('Eje Y');
title('y1 = sin(x), y2=sin(2x), y3 = sen(4x)');
