function x = gaussian(A)
    [m, n] = size(A);
    % Forward elimination process with partial pivoting
    for i = 1:m-1
        % Partial pivoting
        [~, maxIndex] = max(abs(A(i:m, i)));
        maxIndex = maxIndex + i - 1;
        % Swap rows if needed
        if maxIndex ~= i
            A([i, maxIndex], :) = A([maxIndex, i], :);
            disp('is interchanges');
        end
        % Gaussian elimination
        for j = i+1:m
            factor = A(j, i) / A(i, i);
            A(j, i:n) = A(j, i:n) - factor * A(i, i:n);
        end
    end
    
    % Back substitution
    x = zeros(m, 1);
    for i = m:-1:1
        x(i) = (A(i, end) - A(i, i+1:n-1) * x(i+1:end)) / A(i, i);
    end
end

% Define the augmented matrix
augmentedMatrix = [3 1 -4 7; -2 3 1 -5; 2 0 5 10];

% Call the Gaussian elimination function
solution = gaussian(augmentedMatrix);

% Display the solution
disp('The solution vector is:');
disp(solution);
