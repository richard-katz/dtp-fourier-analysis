clear; close all;

% create synthetic times
t = linspace(0,2*pi,1002);

% create synthetic data
y = 2*cos(3*t) + 3*sin(t);

% shorten series so that has an odd number of points.
t = t(1:end-1);
y = y(1:end-1);

% plot time-series
plot(t,y,'-k');

% compute the discrete Fourier series
F = dfs(y)

% create vector of harmonic numbers
kmax = (length(y) - 1)/2;
k = 1:kmax;

% plot the cosine coefficients
semilogx(k,F.alpha,'-or'); hold on;

% plot the sine coefficients
semilogx(k,F.beta,'-xb'); hold on;

% label the graph
xlabel('Harmonic number');
ylabel('DFS coefficient');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; close all;

% characteristics of the time-series
T = 10;    % total duration, years
A1 = 33;   % amplitude 1, Watts
A2 = 75;   % amplitude 2, Watts
f1 = 4/T   % frequency 1, 1/years
f2 = 13/T  % frequency 2, 1/years

% create time-series
t = linspace(0,T,2002);
y = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);

% plot the time-series
plot(t,y,'-k');
xlabel('Time, years'); ylabel('Watts');

% shorten the time-series so that it has an odd number of points
t = t(1:end-1);
y = y(1:end-1);

% compute discrete Fourier transform
F = dfs(y)

% compute a vector of frequencies
N = length(y);
k = 1:(N-1)/2;
freq = k/T;

% plot the power spectrum
plot(freq(1:16),F.power(1:16),'-ok');
xlabel('Frequency, 1/year');
ylabel('Normalised variance');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; close all;

% load the data
data = load('CaveCreekData.txt')
runoff = data(:,1); % 100*in

% check that N is odd
N = length(runoff)

% compute total period of time-series
T = N-1;  % months

% compute the discrete Fourier series
F = dfs(runoff)

% compute a vector of periods
k = 1:(N-1)/2;
per = T./k;

% plot the power spectrum
semilogx(per,F.power,'-ok','LineWidth',1.5,'MarkerSize',5);
xlabel('Period, months'); ylabel('Normalised variance');