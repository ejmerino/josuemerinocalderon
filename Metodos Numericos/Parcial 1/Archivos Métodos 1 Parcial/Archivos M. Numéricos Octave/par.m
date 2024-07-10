%Programa para determinar si un numero es par o impar 
function N = par(numero)
%N=par(35)
if mod(numero,2)==0
    N='El numero es par';
else
    N='El numero es impar';
end



