function [root, iterations, time] = secant_method(f, x0, x1, tol)
    tic;
    iterations = 0;
    while abs(f(x1)) > tol
        x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        x0 = x1;
        x1 = x2;
        iterations = iterations + 1;
    end
    root = x1;
    time = toc;
end