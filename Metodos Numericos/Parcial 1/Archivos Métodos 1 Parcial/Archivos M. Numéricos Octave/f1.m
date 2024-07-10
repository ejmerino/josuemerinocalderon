%Evaluar una funcion por partes
function [y] = f1(x)
%[y] = f1(-10)
if x < 0
    y = x^2;%Si
else
    y = x + 1;%No
end
