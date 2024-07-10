%Programa para resolver un sistema lineal de ecuaciones
%Utilizando el método de Gauss
function[AI Inv x] = MInversa(A,b)
%[Ab Inv x] = MInversa([2 3 -1; 4 2 -3; 3 -4 2],[1 1 -2]')
[n,n]=size(A);
I=eye(n);
AI=[A I];
for k=1:n-1
    [p,q]=max(abs(AI(k:n,k))); %Numero máximo de columnas
    %p=valor condición, q = ubicación
    m=k+q-1;%Real ubicación de elemento máximo
    AI=cambio_de_filas(AI,k,m);%PIVOTEO
    for j=k+1:n %GAUSS
        AI=hacer_ceros(AI,k,j,-AI(j,k)/AI(k,k));
    end
end
%GaussJordan
for k=n:-1:2 %FilaPivote
    for j=k-1:-1:1%Fila para hacer ceros
        AI = hacer_ceros(AI,k,j,-AI(j,k)/AI(k,k));
    end
end
for k=1:n
    AI(k,:) = AI(k,:)/AI(k,k);
end
AI; %Matriz Escalar con unos en la diagonal principal y la matriz inversa
Inv = AI(:,n+1:2*n);%Matriz Inversa
x=Inv*b;
AI=rats(AI);
Inv=rats(Inv);
x=rats(x);
end