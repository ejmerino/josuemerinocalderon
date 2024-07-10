function [raiz, nt, t] = secante(x0, x1, fx)
    % [raiz, nt, t] = secante(1, 2, '(sin((pi*x0)/5) - 0.50)')
    % Esta función encuentra la raíz de la función fx usando el método de la secante.
    % x0 y x1 son las dos primeras estimaciones de la raíz.
    % fx es la función como un string que se evaluará.
    
    % Convertimos la función de string a una función inline
    f = inline(fx);
    
    % Inicializamos las estimaciones de la raíz
    x(1) = x0;
    x(2) = x1;
    
    % Iniciamos el contador de tiempo
    tic
    
    % Inicializamos el contador de iteraciones
    n = 1;
    
    % Establecemos el formato de los números a largo para mayor precisión
    format long
    
    % Iteramos hasta que la diferencia entre dos estimaciones consecutivas sea menor que la raíz cuadrada de eps
    while abs(x(n+1) - x(n)) > sqrt(eps)
        n = n + 1;
        % Aplicamos la fórmula del método de la secante
        x(n+1) = x(n) - (f(x(n)) * (x(n) - x(n-1))) / (f(x(n)) - f(x(n-1)));
    end
    
    % La raíz es la última estimación calculada
    raiz = x(n+1);
    
    % El número total de iteraciones
    nt = n;
    
    % Finalizamos el contador de tiempo
    t = toc;
    
    % Graficamos la función para visualizar la raíz encontrada
    x = 1:0.01:2;
    y1 = x.^3 + 4*x.^2 + 12*x - 30;
    plot(x, y1)
    % Agregamos un punto en la raíz encontrada
    hold on
    plot(raiz, f(raiz), 'ro')
    hold off
end