function [z] = f4(x,y)
%[z]= f4(2,5)
if (x~= 1)&&(y~= 1)% =! diferente
    z = x^2 + y^2;
    else
    z=0;
endif
endfunction
