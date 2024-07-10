matriz = input('Ingrese una matriz (ejemplo: [1, -2, 3; 4, -5, 6]): ');

suma_positivos = 0;

for i = 1:size(matriz, 1)
    for j = 1:size(matriz, 2)
        if matriz(i, j) > 0
            suma_positivos = suma_positivos + matriz(i, j);
        end
    end
end

fprintf('La suma de los números positivos en la matriz es: %d\n', suma_positivos);
