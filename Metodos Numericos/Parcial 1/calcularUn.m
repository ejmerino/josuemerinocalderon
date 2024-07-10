function U = calcularUn(n)
    U = 1; % Inicializar U_1    
    for i = 2:n
        U = (0.5 * U)+1;
    end
end
