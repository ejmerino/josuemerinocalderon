function [root, iterations, time] = newton_method(f, df, x0, tol)
    tic;
    iterations = 0;
    x = x0;
    while abs(f(x)) > tol
        x = x - f(x) / df(x);
        iterations = iterations + 1;
    end
    root = x;
    time = toc;
end
