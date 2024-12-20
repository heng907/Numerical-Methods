% Number of intervals
n = 4;

% Step size
h = pi / (2 * n);

% Coefficient matrix
A = zeros(n+1, n+1);
b = zeros(n+1, 1);

% Boundary conditions
A(1,1) = 1 + h;
A(1,2) = 1;
b(1) = 2 * h;

A(n+1,n) = -1;
A(n+1,n+1) = 1 + h;
b(n+1) = -h;

% Interior points using finite differences
for i = 2:n
    A(i, i-1) = 1;
    A(i, i) = -(2 + h^2);
    A(i, i+1) = 1;
end

% Solve the system of equations
y = A \ b;

% Display the results
x = linspace(0, pi/2, n+1);
disp('x values:');
disp(x');
disp('y values:');
disp(y);

