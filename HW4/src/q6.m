% Define the function to integrate
f = @(x, y) (x - 1).^2 + (y.^2 / 16);

% Define the limits of the region
x_min = -2;
x_max = 3;
y_min = -1;
y_max = 2;

% Number of random points
num_points = 1e6;

% Generate random points within the region
x_rand = x_min + (x_max - x_min) * rand(num_points, 1);
y_rand = y_min + (y_max - y_min) * rand(num_points, 1);

% Evaluate the function at each random point
f_rand = f(x_rand, y_rand);

% Compute the average value of the function
f_avg = mean(f_rand);

% Compute the area of the region
area = (x_max - x_min) * (y_max - y_min);

% Estimate the integral
integral_estimate = f_avg * area;

fprintf('Estimated integral using Monte Carlo integration: %.6f\n', integral_estimate);
