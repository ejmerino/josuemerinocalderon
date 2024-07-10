function [raiz n t]=NEWTONC(x0,fx,gx)
%[raiz n t]=NEWTONC(1,'x^3+4*x^2+12*x-30','3*x+8*x+12')
%[raiz n t]=NEWTONC(1,'x^3+4*x^2+12*x-30','(sin((pi*x)/5) - 0.50)')
%[raiz n t]=NEWTONC(1,'x^3+4*x^2+12*x-30','(sin((pi*x)/5) - 0.50)')
format long
f=inline(fx);
g=inline(gx);
x(1)=x0; %x0=! x(0)(Error)
tic
x(2)=x(1)-f(x(1))/g(x(1)); %x_2=x_1-f(x_1)/g(x_1)
n=1;
while abs(x(n+1)-x(n))>sqrt(eps)
	n=n+1;
	if g(x(n))==0
	display('El metodo no puede aplicarse')
	return
	end
	x(n+1)=x(n)-f(x(n))/g(x(n))
end
raiz=x(n+1);
t=toc
%Grafico
x=1:0.001:2;
y1=x.^3+4*x.^2+12*x-30;
plot(x,y1)
grid on
end