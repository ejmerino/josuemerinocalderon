function [y] = f2(x)
%[y] = f2(2)
if abs(x) < 1 % -1<x<1
    y = x;
    elseif x >=1
        y = x^2;
    else
        y = x + 1;
endif
endfunction
