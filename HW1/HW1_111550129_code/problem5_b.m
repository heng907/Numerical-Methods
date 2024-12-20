g = @(x) sqrt(exp(x) / 2);

% Tolerance for convergence
tol = 1e-5;

% Maximum number of iterations
max_iter = 100;

% Initial guesses
initial_guesses = [2.5, 2.7];

% Perform the fixed-point iteration for both initial guesses
for i = 1:length(initial_guesses)
    x = initial_guesses(i);
    for iter = 1:max_iter
        x_new = g(x);

        % Check for convergence
        if abs(x_new - x) < tol
            fprintf('Starting from x0 = %f, fixed-point iteration converged to x = %f\n', initial_guesses(i), x_new);
            break;
        end

        % If we didn't converge, update the guess for the next iteration
        x = x_new;
    end
    
    % If we reached the maximum number of iterations without convergence
    if iter == max_iter
        fprintf('Starting from x0 = %f, fixed-point iteration did not converge, last x = %f\n', initial_guesses(i), x_new);
    end
end