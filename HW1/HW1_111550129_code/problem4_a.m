f = @(x) 4*x.^3 - 3*x.^2 + 2*x - 1;

% Initial points, chosen around the expected root near x = 0.6
x0 = 0.5;
x1 = 0.6;
x2 = 0.7;

% Tolerance and maximum number of iterations
tol = 1e-5;
max_iter = 100;

% Muller's Method
for iter = 1:max_iter
    % Calculate the coefficients of the quadratic interpolation polynomial
    h1 = x1 - x0;
    h2 = x2 - x1;
    delta1 = (f(x1) - f(x0)) / h1;
    delta2 = (f(x2) - f(x1)) / h2;
    a = (delta2 - delta1) / (h2 + h1);
    b = a * h2 + delta2;
    c = f(x2);
    
    % Calculate the discriminant
    rad = sqrt(b^2 - 4 * a * c);
    
    % Choose the denominator with the larger magnitude
    if abs(b + rad) > abs(b - rad)
        den = b + rad;
    else
        den = b - rad;
    end
    
    % Calculate the next approximation to the root
    dx = -2 * c / den;
    x3 = x2 + dx;
    
    % Check for convergence
    if abs(dx) < tol
        fprintf('Root found: %f.\n', x3);
        break;
    end
    
    % Prepare for next iteration
    x0 = x1;
    x1 = x2;
    x2 = x3;
end

% If we didn't converge, let the user know
if iter == max_iter
    fprintf('Max iterations reached without convergence.\n');
end
