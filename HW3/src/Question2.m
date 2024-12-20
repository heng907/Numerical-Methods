x = [-1, -0.5, 0, 0.5, 1];
y = [0, 0, 1, 0, 0];

% Define a fine grid for evaluation and plotting
xx = linspace(-1, 1, 100);

% Function definition for f(x)
f = @(x) (x>=-0.5 & x<=0.5).*(1 - 2*abs(x));

% Clamped Spline with zero derivatives at endpoints
pp_clamped = csape(x, [0, y, 0], 'clamped');

% Not-a-Knot Spline
pp_notaknot = csape(x, y, 'variational'); % 'variational' is equivalent to not-a-knot

% Evaluate the splines
yy_clamped = ppval(pp_clamped, xx);
yy_notaknot = ppval(pp_notaknot, xx);

% Plot the original function and the splines
figure;
hold on;
plot(xx, f(xx), 'k--', 'LineWidth', 2);
plot(xx, yy_clamped, 'b-', 'LineWidth', 2);
plot(xx, yy_notaknot, 'r-', 'LineWidth', 2);
plot(x, y, 'ko', 'MarkerFaceColor', 'k');
xlim([-1, 1]);
ylim([-0.1, 1.1]);
title('Comparison of Spline Fits');
xlabel('x');
ylabel('f(x)');
grid on;
legend('Original Function', 'Clamped Spline', 'Not-a-Knot Spline', 'Data Points');

