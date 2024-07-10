%Programa que permite sumar dos filas, una de ellas 
%multiplicada por c, i es la fila pivote, j es la fila receptora
function [B] = hacer_ceros(A,i,j,c)
%[A B] = hacer_ceros([1 2 3 4; 2 3 4 5; 3 4 5 6; 4 5 6 7],2,4,-2)
B = A;  % Copiar la matriz original A a M
B(j, :) = B(j, :) + c*B(i, :);
end 