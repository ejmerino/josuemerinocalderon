%Evaluación de una función en dos variables
function z = f5(x,y)
%z = f5(4,3)
if x > 1 && y < 1
    z = x + y;
  elseif x < -1 && y > 1
    z = x^2 + y^2;
  elseif x > 1 && y > 1
    z = abs(x) + abs(y);
  elseif x < - 1 && y < -1
    z = tan(x/y);
  else
    z = 5;
endif
endfunction
