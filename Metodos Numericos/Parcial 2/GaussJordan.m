%Programa para resolver un sistema lineal de ecuaciones
%Utilizando el método de Gauss
function[Ab x] = GaussJordan(A,b)
%[Ab x] = GaussJordan([1 3 5 -2; 2 -2 4 1; 2 3 -4 5; 4 3 -2 1],[2 1 -3 -2]')
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
%GaussJordan
for k=n:-1:2 %FilaPivote
    for j=k-1:-1:1%Fila para hacer ceros
        Ab = hacer_ceros(Ab,k,j,-Ab(j,k)/Ab(k,k));
    end
end
Ab; %Matriz triangular superior e inferior (Escalar)
for k=1:n
    Ab(k,:) = Ab(k,:)/Ab(k,k);
end
Ab; %Matriz escalar con diagonal de unos
x= mts(Ab(:,1:n),Ab(:,n+1)); %Si se desea presentar las soluciones del sistema
Ab=rats(Ab);
x=rats(x);
end