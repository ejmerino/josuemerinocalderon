%Programa para calcular las raices de una funcion,
%por el método de bisección conocido el intervalo,
%y la función
function[raiz, n, t] = biseccion(a,b,fx)

%[raiz n t]=biseccion(1,2,'x^3+4*x^2+12*x-30')
%[raiz n t]=biseccion(0,pi,'(sin((pi*x)/5) - 0.50)')
%[raiz, n, t]=biseccion(1,2,'(sin((pi*x)/5) - 0.50)')
%[raiz n t]=biseccion(0,2,'x^2*2^(-x)-0.25')

f=inline(fx);
if f(a)*f(b)>0
       disp('No hay raiz en este intervalo')
       return
end
tic
n=0;
while abs(a-b)>sqrt(eps) %Tolerancia 10^-8 eps = 10
    if f(a)*f(b)<0
        c=(a+b)/2;
    else f(c)==0
        raiz=c;
        return
    end
    if f(a)*f(c)<0
        b=c;
    else
        a=c;
    end
 n=n+1;
end
raiz=c;
t=toc;
%Grafico
x=1:0.01:2;
y1=x.^3+4*x.^2+12*x-30;
plot(x,y1)
grid on
end

