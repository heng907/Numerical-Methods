g_pos = @(x) sqrt(exp(x) / 2);
g_neg = @(x) -sqrt(exp(x) / 2);

% Initial guess for positive and negative roots
x0_pos = 1.5;
x0_neg = -0.5;

% Tolerance for convergence
tol = 1e-5;

% Maximum number of iterations
max_iter = 100;

% Function to perform fixed-point iteration
function fixed_point_iteration(g, x0, tol, max_iter)
    for iter = 1:max_iter
        x1 = g(x0);
        
        % Check for convergence
        if abs(x1 - x0) < tol
            fprintf('Fixed-point iteration converged to x = %f\n', x1);
            return;
        end
        % Update the guess for the next iteration
        x0 = x1;
    end
    fprintf('Fixed-point iteration did not converge.\n');
end

% Perform fixed-point iteration for positive root
fprintf('For the positive root:\n');
fixed_point_iteration(g_pos, x0_pos, tol, max_iter);

% Perform fixed-point iteration for negative root
fprintf('\nFor the negative root:\n');
fixed_point_iteration(g_neg, x0_neg, tol, max_iter);
