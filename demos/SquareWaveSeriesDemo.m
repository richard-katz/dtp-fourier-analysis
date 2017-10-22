clear; close all;

% define period
T = 1;

% create and plot the function g(t)
t_orig = T/2*[-2 -1 -1  0 0 1  1  2];
g_orig =     [ 1  1 -1 -1 1 1 -1 -1];
plot(t_orig,g_orig,'--k','linewidth',1);
 axis([-3*T/4 3*T/4 -1.5 1.5])

% create the independent variable
t = linspace(-T,T,40000);

% create the dependent variable
g_fs = zeros(size(t));

% compute the fundamental angular frequency
omega = 2*pi/T;

% do the summation over the first 25 terms
for r = 1:2:51
    
    % add the next term to the sum
    g_fs = g_fs + 4/pi/r*sin(omega*r*t);
    
    % plot the original function
    plot(t_orig,g_orig,'--k','LineWidth',1); hold on;

    % plot the current sum of Fourier terms
    plot(t,g_fs,'-b','LineWidth',2); hold off; 
    
    % label the plot
    xlabel('t'); ylabel('g(t)'); 
    axis([-3*T/4 3*T/4 -1.5 1.5])
    
    pause;
end