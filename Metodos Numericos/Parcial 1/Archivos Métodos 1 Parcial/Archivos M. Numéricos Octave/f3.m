function y = f3(x)
%y = f3(5)
if x > 1
    y = 1/(x-1);
    elseif x < -1
    y = 1/ (x + 1);
    else
    disp('No esta definida')
endif
endfunction
