clear; close all;

% make initial condition
Y  = [-10 -2 -1 -0.3 0.5 0.501 3    3.001 10];
TI = [  0  0  1  0   0   1.35  1.35 0     0];
plot(Y,TI,'-k');

% interpolate onto a fine grid
y  = linspace(-10,10,1001);
Ti = interp1(Y,TI,y,'linear');
t  = linspace(0,5,100);
hold on;
plot(y,Ti,'--r'); hold off;

% compute the diffusion profiles
Tf = dfs_diffusion(y,Ti,0.1,t);

% plot as a movie
for i=1:length(t)
  plot(y,Tf(:,i),'-k');
  title(['t = ',num2str(t(i))])
  axis([-10 10 -0.1 1.5])
  pause(0.1);
end