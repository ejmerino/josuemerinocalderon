function [root, iterations, time] = bisection_method(f, a, b, tol)
    tic;
    iterations = 0;
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        if f(c) == 0
            break;
        elseif f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
        iterations = iterations + 1;
    end
    root = (a + b) / 2;
    time = toc;
end
