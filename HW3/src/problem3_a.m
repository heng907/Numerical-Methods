% Define the points
P0 = [0, 0];
P1 = [1, 0.3];
P2 = [2, 1.7];
P3 = [3, 1.5];

% Generate t values
t = linspace(0, 1, 100);

% Calculate the Bézier curve
Bx = (1-t).^3 * P0(1) + 3*(1-t).^2 .* t * P1(1) + 3*(1-t).*t.^2 * P2(1) + t.^3 * P3(1);
By = (1-t).^3 * P0(2) + 3*(1-t).^2 .* t * P1(2) + 3*(1-t).*t.^2 * P2(2) + t.^3 * P3(2);

% Plot the Bézier curve
figure;
plot(Bx, By, 'b-', 'LineWidth', 2);
hold on;

% Plot the zigzag line
zigzagX = [P0(1), P1(1), P2(1), P3(1)];
zigzagY = [P0(2), P1(2), P2(2), P3(2)];
plot(zigzagX, zigzagY, 'r--', 'LineWidth', 1);

% Add points
plot(zigzagX, zigzagY, 'ko', 'MarkerFaceColor', 'k');

% Labels and legend
title('Cubic Bézier Curve and Zigzag Line');
xlabel('x');
ylabel('y');
legend('Cubic Bézier Curve', 'Zigzag Line', 'Control Points');
grid on;

% Adjust the axis limits for better viewing
axis equal;
xlim([-0.5, 3.5]);
ylim([-0.5, 2]);

