function root = bisection(f, a, b, tol)
    if f(a) * f(b) > 0
        error('f(a) and f(b) must have opposite signs')
    end
    cnt = 0;
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        if f(c) == 0
            break;
        elseif f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
        cnt = cnt + 1;
    end
    fprintf('there is %d interation(s).\n', cnt);
    root = (a + b) / 2;
end

% Define the function
f = @(x) x .* sin((x - 2)/ (x - 1));

% Define the interval and tolerance
a = 0.96;  % change the interval
b = 0.965;    % chacnge the interval
tol = 1e-5;  % tolerance for bisection method

% Find the root
root = bisection(f, a, b, tol);
disp(['Root near x = 0.95 is x = ', num2str(root, '%1.5f')]);
