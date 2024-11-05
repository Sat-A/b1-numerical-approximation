close all; clear;
% Set the maximum number of points
max_n = 1e5;
% Define the number of steps (intervals) to increase n
steps = 500; % Reduced for faster computation and smoother visualization

% Initialize arrays to store results
n_values = linspace(1, max_n, steps); % Values of n to test
pi_estimates = zeros(1, steps);       % Store Pi estimates for each n
errors = zeros(1, steps);             % Store moving error estimates for each n
errors_var = zeros(1, steps);

% Loop over each n value and estimate Pi
for i = 1:steps
    % Number of points for this iteration
    n = round(n_values(i));
    
    % Generate random x and y coordinates between 0 and 1
    x = rand(n, 1);
    y = rand(n, 1);

    % Calculate distance from the origin
    distance = sqrt(x.^2 + y.^2);

    % Count points inside the quarter circle
    points_inside_circle = sum(distance <= 1);

    % Estimate Pi
    pi_estimates(i) = 4 * (points_inside_circle / n);

    % Function to estimate accuracy using std()
    errors(i) = std(pi_estimates(1:i));
    
end

% Define the upper and lower bounds for the shaded convergence region
upper_bound = pi_estimates + errors;
lower_bound = pi_estimates - errors;

% Plotting the estimated Pi values with a shaded convergence region
figure;
hold on;

% Plot the shaded convergence region
fill([n_values, fliplr(n_values)], [upper_bound, fliplr(lower_bound)], ...
    'm', 'EdgeColor', 'none', 'FaceAlpha', 0.3);

% Plot the estimated Pi values
plot(n_values, pi_estimates, 'r-', 'LineWidth', 1);

% Plot the true value of Pi for reference
yline(pi, 'b--', 'LineWidth', 1.5); % Actual value of Pi

% Label the plot
xlabel('Number of Points (n)');
ylabel('Estimated Value of Pi');
title('Estimation of Pi Using Monte Carlo Method');
legend('Convergence Region', 'Estimated \pi', '\pi');
grid on;
ylim([2.75, 3.5]);
hold off;

