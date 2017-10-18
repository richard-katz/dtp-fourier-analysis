clear; close all;

axw = 6;
axh = 3;
axls = 0.6;
axrs = 0.1;
axbs = 0.5;
axts = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh],'box','on'); hold on;

x = linspace(0,100,1000);
eta0 = sin(pi*x/100) - interp1([0 35 40 45 100],[0 0 0.4 0 0],x);
time = [0 10 35 50 65 90 100]';
eta = dfs_standingwaves(x,eta0,1,time);
p = plot(x,eta);
legend(p,num2str(time),'Location','NorthOutside','Orientation','Horizontal');
axis([0 100 -1.1 1.1])
text(0.5,-0.14,'$x$','Interpreter','latex','FontSize',13,'Units','Normalized',HA,'center')
text(-0.07,0.5,'$\eta(x,t)$','Interpreter','latex','FontSize',13,'Units','Normalized','rotation',90,HA,'center')

print -dpdf StringEvolution
close all;