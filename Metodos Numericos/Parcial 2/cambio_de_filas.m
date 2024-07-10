function [B] = cambio_de_filas(A,i,j)
%[A,B] = cambio_de_filas([3 4 2; 1 2 5; 5 3 -2],1,2)
B = A; % Matriz Temporal
B(i, :) = A(j, :);
B(j, :) = A(i,:);
end