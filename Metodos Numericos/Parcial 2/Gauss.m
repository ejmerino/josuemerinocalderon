%Programa para resolver un sistema lineal de ecuaciones
%Utilizando el método de Gauss
function[Ab x] = Gauss(A,b)
%[Ab x] = Gauss([1 3 5 -2; 2 -2 4 1; 2 3 -4 5; 4 3 -2 1],[2 1 -3 -2]')
%
[n,n]=size(A);
Ab = [A b]%Matriz ampliada entre A y b
for k=1:n-1
    [p,q]=max(abs(Ab(k:n,k))); %Numero máximo de columnas
    %p=valor condición, q = ubicación
    m=k+q-1;%Real ubicación de elemento máximo
    Ab=cambio_de_filas(Ab,k,m);%PIVOTEO
    for j=k+1:n %GAUSS
        Ab=hacer_ceros(Ab,k,j,-Ab(j,k)/Ab(k,k));
    end
end
Ab; %Matriz Triangular Superir
x=mts(Ab(:,1:n),Ab(:,n+1));
Ab=rats(Ab);
x=rats(x);
end