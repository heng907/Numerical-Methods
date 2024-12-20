function dydt = odesystem(t, y)
    dydt = zeros(3,1);
    dydt(1) = y(2);
    dydt(2) = y(3);
    dydt(3) = t - t * y(2) + 2 * y(1);
end

% Initial conditions
t0 = 0;
y0 = [0; 1; 0]; % y(0) = 0, y'(0) = 1, y''(0) = 0

% Time span and step size
t_final = 1.0;
h = 0.1;
tspan = t0:h:t_final;

% Initial values
y = zeros(length(tspan), 3);
y(1, :) = y0';

% First few steps using RKF to initialize Adams-Moulton
[t_rkf, y_rkf] = ode45(@odesystem, [t0, t0+2*h], y0);

% Copy initial values
y(2,:) = y_rkf(2,:);
y(3,:) = y_rkf(3,:);

% Adams-Moulton Method (Second-order implicit)
for i = 3:length(tspan)-1
    t_prev = tspan(i);
    y_prev = y(i, :)';
    t_next = tspan(i+1);
    
    % Predictor (using Adams-Bashforth)
    y_predict = y(i, :)' + h * (23/12 * odesystem(t_prev, y_prev) - 16/12 * odesystem(tspan(i-1), y(i-1,:)') + 5/12 * odesystem(tspan(i-2), y(i-2,:)'));
    
    % Corrector (using Adams-Moulton)
    y(i+1, :) = y(i, :) + h * (5/12 * odesystem(t_next, y_predict) + 8/12 * odesystem(t_prev, y_prev) - 1/12 * odesystem(tspan(i-1), y(i-1,:)'))';
end

% Display the results at specific points
fprintf('y(0.2) = %.5f\n', y(tspan == 0.2, 1));
fprintf('y(0.4) = %.5f\n', y(tspan == 0.4, 1));
fprintf('y(0.6) = %.5f\n', y(tspan == 0.6, 1));
fprintf('y(1.0) = %.5f\n', y(tspan == 1.0, 1));
