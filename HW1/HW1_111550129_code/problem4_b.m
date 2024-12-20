f = @(x) x.^2 + exp(x) - 5;
% Initial points for the root near x = 1
x0_1 = 0.8;
x1_1 = 1.0;
x2_1 = 1.2;

% Initial points for the root near x = -2
x0_2 = -2.2;
x1_2 = -2.0;
x2_2 = -1.8;

% Tolerance and maximum number of iterations
tol = 1e-5;
max_iter = 100;

% Function to implement Muller's Method
function mullers_method(f, x0, x1, x2, tol, max_iter)
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
end

% Run Muller's Method for both sets of initial points
fprintf('For root near x = 1:\n');
mullers_method(f, x0_1, x1_1, x2_1, tol, max_iter);

fprintf('\nFor root near x = -2:\n');
mullers_method(f, x0_2, x1_2, x2_2, tol, max_iter);
