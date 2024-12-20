lambda = 0.1; % This is an arbitrary choice; it may need tuning.
g = @(x) log(2*x^2) ;

% Start the iteration at a point close to the expected root
x0 = 2.5;

% Perform the fixed-point iteration
x = x0;
for iter = 1:max_iter
    x_new = g(x);
    
    % Check for convergence
    if abs(x_new - x) < tol
        fprintf('Converged to x = %f\n', x_new);
        break;
    end
    
    % Update the guess for the next iteration
    x = x_new;
end

% If no convergence, output a message
if iter == max_iter
    fprintf('Did not converge.\n');
end
