% Define the function
p = @(x) (x - 2).^3 .* (x - 4).^2;

% Initial brackets [a, b]
a = 3.995;
b = 4.005;

% Tolerance and maximum number of iterations
tol = 1e-5;
max_iter = 100;

% Bisection Method
for iter = 1:max_iter
    c = (a + b) / 2;  % Midpoint
    fc = p(c);
    
    if p(a) * fc < 0
        b = c;
    else
        a = c;
    end
    
    % Check for convergence
    if abs(b - a) < tol
        fprintf('Root found: %f\n', c);
        break;
    end
end

% If we didn't converge, let the user know
if iter == max_iter
    fprintf('Max iterations reached without convergence.\n');
end
