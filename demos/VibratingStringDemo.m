clear; close all;

% problem parameters
A = 1;
l = 1;
c = 1;
N = 1000;
time = linspace(0,2,41);

% create initial condition
X    = [0 l/2 l];
Eta0 = [0 1   0];
x    = linspace(0,l,1000)';
eta0 = interp1(X,Eta0,x);

% plot initial condition
p1 = plot(x,eta0,'-b'); hold on;
axis([0 l -A A]); pause;

% prepare to calculate solution
nyquist = round((N-1)/2);

for i=1:length(time)  % for each requested time
  delete(p1);
  eta = zeros(N,1);
  for n = 1:2:nyquist  % compute each fourier mode
    sign = (-1)^((n-1)/2);
    kapn = n*pi/l;
    eta = eta + 8 / pi^2 / n^2 * sign * sin(kapn*x) * cos(c*kapn*time(i));
  end
  p1 = plot(x,eta,'-r'); % plot the current solution
  title(['time = ',num2str(time(i),'%.2f')])
  pause(0.1); 
end

pause; clear; close all;

x = linspace(0,100,1000);
eta0_a = sin(pi*x/100);
eta0_b = interp1([0 35 40 45 100],[0 0 0.4 0 0],x);
plot(x,eta0_a, x,eta0_b,'LineWidth',2);

time = linspace(0,210,70);

% demo 1
eta_a = dfs_stringwaves(x,eta0_a,1,time);
for i=1:length(time)
  plot(x,eta_a(:,i)); axis([0 100 -1 1]);
  title(['time =',num2str(time(i),'%.2f')]);
  pause(0.1);
end

% demo 2
eta_b = dfs_stringwaves(x,eta0_b,1,time);
for i=1:length(time)
  plot(x,eta_b(:,i)); axis([0 100 -1 1]);
  title(['time =',num2str(time(i),'%.2f')]);
  pause(0.1);
end

% demo 3
eta = dfs_stringwaves(x,eta0_a+eta0_b,1,time);
for i=1:length(time)
  plot(x,eta(:,i)); axis([0 100 -1.5 1.5]);
  title(['time =',num2str(time(i),'%.2f')]);
  pause(0.1);
end




  