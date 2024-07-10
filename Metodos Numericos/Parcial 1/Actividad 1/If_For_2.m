vector = input('Ingrese un vector de números: ');

for i = 1:length(vector)
    if mod(vector(i), 2) == 0
        fprintf('El número %d es par.\n', vector(i));
    else
        fprintf('El número %d es impar.\n', vector(i));
    end
end
