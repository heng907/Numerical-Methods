% Given data points
x = [0.40, 1.2, 3.4, 4.1, 5.7, 7.2, 9.3];
y = [0.70, 2.1, 4.0, 4.9, 6.3, 8.1, 8.9];
z = [0.031, 0.933, 3.058, 3.349, 4.870, 5.757, 8.921];

% Building the matrix A for the normal equations
A = [sum(x.^2), sum(x.*y), sum(x);
     sum(x.*y), sum(y.^2), sum(y);
     sum(x), sum(y), length(x)];

% Building the vector B for the normal equations
B = [sum(x.*z);
     sum(y.*z);
     sum(z)];

% Solving for the coefficients [a; b; c]
coefficients = A \ B;

% Display the coefficients
a = coefficients(1);
b = coefficients(2);
c = coefficients(3);
fprintf('Plane equation is z = %f*x + %f*y + %f\n', a, b, c);
