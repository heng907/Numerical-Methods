% Define the function
f = @(x) x .* sin((x - 2) ./ (x - 1));

% Create a range for x near 0.95 and where the function is interesting
x_range = linspace(0.8, 1.2, 1000); % Adjust this as necessary based on the plot

% Calculate the function values
y_values = arrayfun(f, x_range);

% Plot the function
figure;
plot(x_range, y_values);
grid on;
xlabel('x');
ylabel('f(x)');
title('Plot of the function f(x) = x * sin((x-2)/(x-1))');
