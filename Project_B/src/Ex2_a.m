clear; clc; close all;

% Parameters
lambda = 1550e-9; % Wavelength 
k = 2*pi/lambda; 
N = 8; % Number of array elements
d_x = lambda/2; 

% Angular parameters 
theta = linspace(0, 2*pi, 361);     

% Current amplitudes 
a_n = ones(1, N);

% Calculate phases for steering 
theta_0 = 30;
theta_0_rad = theta_0 * pi/180; % Convert to rad
phi_n = zeros(1, N);
for n = 0:N-1
    phi_n(n+1) = -n * k * d_x * sin(theta_0_rad);
end

%phi_n = [0 0 0 0 0 0 0 0]; % 0° beam steering  
%phi_n = [0 2.657 2.1724 1.6878 1.2032 0.7186 0.234 5.5319]; % 30° beam steering
%phi_n = [0 2.9921 5.9842 2.6931 5.6852 2.3941 5.3862 2.0951]; % 60° beam steering
%phi_n = [0 1.4077 2.8153 4.2230 5.6307 0.7551 2.1628 3.5705]; % 90° beam steering

% Array Factor Calculation
AF = zeros(size(theta));

for n = 0:N-1
    phase_term = 1j * phi_n(n+1) + 1j * n * k * d_x * sin(theta);
    AF = AF + abs(a_n(n+1)) * exp(phase_term);
end

% Calculate magnitude and normalize
AF_magnitude = abs(AF);
AF_normalized = AF_magnitude / max(AF_magnitude);

% Polar Plot
figure
polarplot(theta, AF_normalized);
ax = gca;
ax.ThetaDir = 'clockwise';  
ax.ThetaZeroLocation = 'top';
title(sprintf('Array factor - Beam steered to %d°', theta_0));
rlim([0, 1]);
rticks([0.5, 1.0]);
thetaticks(0:30:330);

% Display results
fprintf('\nPhase shifts for %d° beam steering:\n', theta_0);
for n = 1:N
    rad_wrapped = mod(phi_n(n), 2*pi); % Convert rad in [0, 2π]
    deg_wrapped = mod(rad_wrapped * 180 / pi, 360); % Convert to degrees in [0, 360]
    fprintf('Element %d: %.4f rad (%.1f°) or %.4f rad (%.1f°)\n', ...
        n, phi_n(n), phi_n(n)*180/pi, rad_wrapped, deg_wrapped);
end