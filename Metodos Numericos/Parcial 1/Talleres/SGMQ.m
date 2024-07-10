S = 0;
n = 151;

for k = 1:n
    S = S + 1 / (8*k - 6);
end

disp(['La suma de la serie es: ', S]);
S