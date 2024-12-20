% Given data points
x = [0.40, 1.2, 3.4, 4.1, 5.7, 7.2, 9.3];
y = [0.70, 2.1, 4.0, 4.9, 6.3, 8.1, 8.9];
z = [0.031, 0.933, 3.058, 3.349, 4.870, 5.757, 8.921];

% Plane coefficients (example values, replace with your actual results)
a = 1.596092;  % Example value
b = -0.702381;  % Example value
c = 0.220666; % Example value

% Calculate predicted z-values using the plane equation
z_pred = a * x + b * y + c;

% Calculate the deviations
deviations = z - z_pred;

% Calculate the sum of the squares of the deviations
sum_of_squares = sum(deviations.^2);

% Display the sum of squares
fprintf('The sum of the squares of the deviations is: %f\n', sum_of_squares);