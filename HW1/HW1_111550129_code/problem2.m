f = @(x) x .* sin((x - 2) ./ (x - 1));
% Initial guesses
x0 = 0.96;
x1 = 0.965;

% Tolerance and maximum number of iterations
tol = 1e-5;
max_iter = 100;

% Implement the secant method
for iter = 1:max_iter
    x2 = x1 - f(x1) * ((x1 - x0) / (f(x1) - f(x0))); % Secant formula
    % Check for convergence
    if abs(x2 - x1) < tol
        fprintf('Root found: %f after %d iterations\n', x2, iter);
        break;
    end
    % Prepare for next iteration
    x0 = x1;
    x1 = x2;
end


% If we didn't converge, let the user know
if iter == max_iter
    fprintf('Max iterations reached without convergence.\n');
end
