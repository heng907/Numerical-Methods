% Define the differential equation
f = @(x, y) sin(x) + y;

% Initial conditions
x0 = 0;
y0 = 2;

% Step size
h = 0.01;

% Number of steps to reach x = 0.5
n_steps = 0.5 / h;

% Initialize arrays to store the values
x = zeros(1, n_steps + 1);
y = zeros(1, n_steps + 1);

% Set initial values
x(1) = x0;
y(1) = y0;

% Apply the modified Euler method
for i = 1:n_steps
    x(i + 1) = x(i) + h;
    k1 = f(x(i), y(i));
    y_predict = y(i) + h * k1;
    k2 = f(x(i + 1), y_predict);
    y(i + 1) = y(i) + (h / 2) * (k1 + k2);
end

% Display the results
fprintf('y(0.1) = %.5f\n', y(floor(0.1/h) + 1));
fprintf('y(0.5) = %.5f\n', y(end));