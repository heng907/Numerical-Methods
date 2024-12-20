function dydt = odesystem(t, y)
    dydt = zeros(3,1);
    dydt(1) = y(2);
    dydt(2) = y(3);
    dydt(3) = t - t * y(2) + 2 * y(1);
end

% Initial conditions
t0 = 0;
y0 = [0; 1; 0]; % y(0) = 0, y'(0) = 1, y''(0) = 0

% Time points where solution is sought
tspan = [t0 0.6];

% Solve using Runge-Kutta-Fehlberg method
[t, y] = ode45(@odesystem, tspan, y0);

% Interpolating the results to get y(0.2), y(0.4), and y(0.6)
y_at_02 = interp1(t, y(:,1), 0.2);
y_at_04 = interp1(t, y(:,1), 0.4);
y_at_06 = interp1(t, y(:,1), 0.6);

% Display the results
fprintf('y(0.2) = %.5f\n', y_at_02);
fprintf('y(0.4) = %.5f\n', y_at_04);
fprintf('y(0.6) = %.5f\n', y_at_06);
