% Gaussian quadrature points and weights for three-point formula
points = [-sqrt(3/5), 0, sqrt(3/5)];
weights = [5/9, 8/9, 5/9];

% Integration limits
a_x = -0.2; b_x = 1.4;
a_y = 0.4; b_y = 2.6;

% Transformation for x
x = @(eta) 0.5 * ((b_x - a_x) * eta + (b_x + a_x));
dx = 0.5 * (b_x - a_x);

% Transformation for y
y = @(xi) 0.5 * ((b_y - a_y) * xi + (b_y + a_y));
dy = 0.5 * (b_y - a_y);

% Function to integrate
f = @(x, y) exp(x) .* sin(2*y);

% Initialize integral result
integral_result = 0;

% Perform Gaussian quadrature in both directions
for i = 1:length(points)
    for j = 1:length(points)
        xi = points(i);
        eta = points(j);
        wi = weights(i);
        wj = weights(j);
        
        % Calculate transformed x and y
        x_val = x(eta);
        y_val = y(xi);
        
        % Evaluate function at transformed points
        f_val = f(x_val, y_val);
        
        % Sum up the weighted function values
        integral_result = integral_result + wi * wj * f_val * dx * dy;
    end
end

% Display the result
fprintf('Estimated integral using Gaussian quadrature: %.5f\n', integral_result);
