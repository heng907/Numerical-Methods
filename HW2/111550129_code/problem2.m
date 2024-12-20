% Define the coefficients matrix
A = [0.1, 51.7; 5.1, -7.3];
b = [104; 16];

% Part (b): Solve with partial pivoting
x_b = A \ b;
% Part (c): Solve using scaled partial pivoting
% Find the scaling factors for each equation
scale_factors = max(abs(A), [], 2);
% Divide each row by its scaling factor
scaled_A = bsxfun(@rdivide, A, scale_factors);
scaled_b = b ./ scale_factors;
% Now solve with partial pivoting
x_c = scaled_A \ scaled_b;

% Display results
disp('part(b)');
disp('Solution with partial pivoting: ');
disp(x_b);
disp('part(c)');
disp('Solution with scaled partial pivoting:');
disp(x_c);
