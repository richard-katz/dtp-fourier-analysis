clear; close all;

% create synthetic time-series with linear trend
T = 100; % years 
N = 1001; % data points
t = linspace(0,T,N+1); 
y = 2*cos(2*pi*t*5/T) + ... 
      sin(2*pi*t*12/T) + ...
    8*t/T + ...
    0.4*randn(size(t));
plot(t,y,'-k');

% compute and plot discrete fourier series
F = dfs(y(1:end-1));
k = [1:(N-1)/2];
semilogx(k,F.alpha,'-or'); hold on; 
semilogx(k,F.beta,'-xb');
semilogx([5 5],[-3 3],':k',[12 12],[-3 3],':k'); hold off;
xlabel('Harmonic number'); ylabel('Coef. amplitude');

% now DETREND the time-series and try again
ydt = y - 8/T*t;
Fdt = dfs(ydt(1:end-1));
figure
semilogx(k,Fdt.alpha,'-or'); hold on; 
semilogx(k,Fdt.beta,'-xb'); hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;

% make a synthetic time-series with a non-linear trend
T = 100;
N = 1001;
t = linspace(0,T,N+1)';
y =     cos(2*pi*t*5/T) + ...
    0.5*sin(2*pi*t*12/T) - ...
    15*(t/T).^3 + ...
    0.4*randn(size(t));

% use polynomial fitting
m1 = fit(t,y,'poly1')
m2 = fit(t,y,'poly2')

% plot time-series and fits
plot(t,y,'-k'); hold on;
plot(t,m1(t),'--r');
plot(t,m2(t),'--b'); hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;

% make synthetic time-series
y = rand([1 100]);
length(y)

% take Fast Fourier Transform with Matlab's built-in function
Y = fft(y);
length(Y)