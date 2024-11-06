close all; clear;

% Define the true value of Pi for comparison
true_pi = vpa(pi);

% Define the maximum number of intervals for the trapezoidal rule
max_n = 1000; % You can adjust this value for more steps
n_values = 1:max_n; % Array of step sizes
pi_estimates = zeros(1, max_n); % Array to store estimated values of Pi

% Loop over different numbers of intervals
for n = n_values
    x = linspace(-1, 1, n+1); % Create x values from -1 to 1
    y = sqrt(1 - x.^2); % Compute the upper half of the unit circle

    % Compute the area using the trapezoidal rule
    area_upper_half = trapz(x, y); % Area of the upper half of the circle
    area_circle = area_upper_half * 2; % Total area of the circle

    % Store the estimate of Pi
    pi_estimates(n) = area_circle; 
end

% Calculate the error for each estimate
errors = abs(pi_estimates - true_pi);

% Plotting the estimated Pi values and errors
figure;

% Plot the estimates of Pi
subplot(2, 1, 1); % Create a subplot for the estimates
plot(n_values, pi_estimates, 'r-', 'LineWidth', 2);
hold on;
yline(pi, 'b--', 'LineWidth', 1.5); % True value of Pi for reference
xlabel('Number of Intervals (n)');
ylabel('Estimated Value of Pi');
title('Estimation of Pi Using Trapezoidal Integration');
legend('Estimated Pi', '\pi', 'Location', 'best');
ylim([0, 3.5])
grid on;

% Plot the error
subplot(2, 1, 2); % Create a subplot for the errors
semilogy(n_values, errors, 'g-', 'LineWidth', 2); % Use semilogy for better visibility
xlabel('Number of Intervals (n)');
ylabel('Absolute Error');
title('Error in Pi Estimation');
grid on;

% Display the final estimated value of Pi and its error
fprintf('Final estimated value of Pi: %.10f\n', pi_estimates(end));
fprintf('Final absolute error: %+.6e\n', errors(end));
fprintf('Final variance: %+.6e\n', var(pi_estimates));
