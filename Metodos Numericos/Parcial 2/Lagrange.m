%Programa para interpolar puntos coordenados
%utilizando el método de Lagrange
function[P]=Lagrange(x,y)
%[P]=Lagrange([1 3 4 6],[4 8 10 7])
%x son abscisas, y ordenadas de los nods
n=length(x);
L=zeros(n);
for k=1:n
    V=1;
    for j=1:n
        if k ~=j;
            V=conv(V,poly(x(j)))/(x(k)-x(j));
        end
    end
    L(k,:)=V;%Coeficientes de Lagrange
end
P=y*L;
%coeficientes polinomio descendente
%grafico
x1=min(x):0.1:max(x)
%Para Graficar%y1=polyval(P,x1);%Usamos el
y1=polyval(P,x1);
plot(x1,y1,'g',x,y,'or')
title('Polinomio interpolador')
end