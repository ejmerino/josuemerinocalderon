%Programa que calcule los n primeros
%terminos de la sucesion de Fibonacci
function [F] = fibonacci(n)
%F=fibonacci(10)
F(1)=1;
F(2)=1;
for k=3:n
    F(k)=F(k-1)+F(k-2);
end
F;
end
