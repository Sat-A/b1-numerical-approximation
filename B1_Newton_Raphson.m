close all; clear;

% Initial guess close to pi
x0 = 3;
% Tolerance for convergence
tolerance = 1e-20;
% Maximum number of iterations
max_iter = 1000;

% Initialize arrays to store estimates and absolute errors for plotting
estimates = zeros(1, max_iter);
absolute_errors = zeros(1, max_iter);

% True value of Pi for error calculation
true_pi = vpa(pi);

% Newton-Raphson iteration
for iter = 1:max_iter
    % Store the current estimate and calculate absolute error
    estimates(iter) = x0; % Store current estimate
    absolute_errors(iter) = abs(x0 - true_pi); % Calculate absolute error
    
    % Evaluate function and derivative at the current estimate
    fx = sin(x0); % Evaluate sin at x0
    dfx = cos(x0); % Evaluate cos at x0
    
    % Update the estimate using the Newton-Raphson formula
    x1 = x0 - fx / dfx;
    
    % Check for convergence
    if abs(x1 - x0) < tolerance
        estimates(iter + 1) = x1; % Store final estimate
        absolute_errors(iter + 1) = abs(x1 - true_pi); % Store final absolute error
        iter = iter + 1; % Increment iteration count to include the final estimate
        break;
    end
    
    % Update x0 for the next iteration
    x0 = x1;
end

% Trim the arrays to the actual number of iterations
estimates = estimates(1:iter);
absolute_errors = absolute_errors(1:iter);

% Plotting the convergence of the Newton-Raphson estimates
figure;

% Plot the estimates of pi
subplot(2, 1, 1); % Create a subplot for estimates
plot(0:iter-1, estimates, '-o', 'LineWidth', 1.5);
hold on;
yline(pi, 'r--', 'LineWidth', 1.5); % Reference line for true value of Pi

xlabel('Iteration');
ylabel('Estimate of \pi');
title('Convergence of Newton-Raphson Method for Estimating \pi');
legend('Newton-Raphson Estimate', 'True Value of \pi', 'Location', 'best');
grid on;
xticks(0:iter-1); % Set x-ticks to integer iterations

% Plot the absolute errors
subplot(2, 1, 2); % Create a subplot for absolute errors
semilogy(0:iter-1, absolute_errors, '-o', 'LineWidth', 1.5); % Log scale for errors
xlabel('Iteration');
ylabel('Absolute Error');
title('Absolute Error in Newton-Raphson Method');
grid on;
xticks(0:iter-1); % Set x-ticks to integer iterations

% Display the final result
fprintf('Estimated value of Pi: %.10f\n', x1);
fprintf('Number of iterations: %d\n', iter-1); % Display total iterations
