function S = calcularSerie(x)
    S = (1/2)*x - (3/(2*4))*x^2 + (15/(2*4*6))*x^3 - (105/(2*4*6*8))*x^4;
    fprintf('Para x = %.6f, la serie es S = %.6f\n', x, S);
end
