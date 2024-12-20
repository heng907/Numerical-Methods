F1 = @(x, y) y - cos(x)^2;
F2 = @(x, y) x^2 + y^2 - x - 2;

% Define the Jacobian matrix
J = @(x, y) [2*sin(x)*cos(x), 1; 2*x - 1, 2*y];

% Initial guesses for x and y
x0 = 1;
y0 = 1;

% Tolerance for convergence
tol = 1e-5;

% Maximum number of iterations
max_iter = 100;

% Newton's method iteration
for iter = 1:max_iter
    F = [F1(x0, y0); F2(x0, y0)];
    J_inv = inv(J(x0, y0));
    xy_new = [x0; y0] - J_inv * F;
    
    % Check for convergence
    if norm(xy_new - [x0; y0], inf) < tol
        fprintf('Solution converged to x = %f, y = %f\n', xy_new(1), xy_new(2));
        break;
    end
    
    % Update the guesses for the next iteration
    x0 = xy_new(1);
    y0 = xy_new(2);
end

% If no convergence, output message
if iter == max_iter
    fprintf('Newton''s method did not converge\n');
end
