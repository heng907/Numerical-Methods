p = @(x) (x - 2).^3 .* (x - 4).^2;

% Interval [1, 5]
x0 = 1;
x1 = 5;

% Tolerance for stopping criterion
tol = 1e-5;

% Maximum number of iterations
max_iter = 100;

% Secant Method Implementation
for iter = 1:max_iter
    % Compute the value at our current guesses
    f_x0 = p(x0);
    f_x1 = p(x1);
    
    % Compute the next guess using the secant method
    x2 = x1 - f_x1 * ((x1 - x0) / (f_x1 - f_x0));
    
    % Stopping criterion based on the change in x
    if abs(x2 - x1) < tol
        fprintf('Secant method converged to x = %f\n', x2);
        break;
    end
    
    % Update the previous two values for the next iteration
    x0 = x1;
    x1 = x2;
end

% If no convergence, output message
if iter == max_iter
    fprintf('Secant method did not converge.\n');
end
