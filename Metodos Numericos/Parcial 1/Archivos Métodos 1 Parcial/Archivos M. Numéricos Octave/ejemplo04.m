%Cálculo de una serie
function [suma] = ejemplo04(x,n)
%[suma] = ejemplo04(2,10)
suma=0;
  for k=0:n
    suma=suma +x^k/factorial(k);
  end
end
