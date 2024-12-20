function [x_jacobi, x_gauss_seidel] = iterative(A, b, x0, maxIterations, tolerance)
    n = length(b);
    x_jacobi = x0;
    x_gauss_seidel = x0;
    
    % Iteration for Jacobi method
    for iter = 1:maxIterations
        x_old = x_jacobi;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i,j) * x_old(j);
                end
            end
            x_jacobi(i) = (b(i) - sigma) / A(i,i);
        end
        if norm(x_jacobi - x_old, inf) < tolerance
            fprintf('Jacobi method converged after %d iterations.\n', iter);
            break;
        end
    end
    
    % Iteration for Gauss-Seidel method
    for iter = 1:maxIterations
        x_old = x_gauss_seidel;
        for i = 1:n
            sigma = 0;
            for j = 1:i-1
                sigma = sigma + A(i,j) * x_gauss_seidel(j);
            end
            for j = i+1:n
                sigma = sigma + A(i,j) * x_old(j);
            end
            x_gauss_seidel(i) = (b(i) - sigma) / A(i,i);
        end
        if norm(x_gauss_seidel - x_old, inf) < tolerance
            fprintf('Gauss-Seidel method converged after %d iterations.\n', iter);
            break;
        end
    end
end

% Define the matrix A and vector b
A = [7 -3 4; 2 5 3; -3 2 6];
b = [6; -5; 2];
x0 = [0; 0; 0];
% e = 0.00001

[x_jacobi, x_gauss_seidel] = iterative(A, b, x0, 1000, 0.00001);
disp(['Starting vector: [' num2str(x0') ']']);
disp(['Jacobi solution: [' num2str(round(x_jacobi,5)') ']']);
disp(['Gauss-Seidel solution: [' num2str(round(x_gauss_seidel',5)) ']']);
