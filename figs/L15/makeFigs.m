clear; close all;


data = load('CaveCreekData.txt');
r = data(:,1);
N = length(r); % number of data points
F = dfs(r);    % dfs
T = 18*12+1;   % months
k = 1:(N-1)/2; % harmonic number
freq = k/T;    % frequency
per = 1./freq;

axw = 6;
axh = 1.5;
axls = 0.7;
axrs = 0.1;
axbs = 0.5;
axts = 0.1;
axms = 0.7;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+2*axh+axms+axts,'inches');
ax(1) = axes('Units','inches','position',[axls axbs+axh+axms axw axh]);
ax(2) = axes('Units','inches','position',[axls axbs axw axh]);
plot(ax(1),r,'-k','LineWidth',1.5);
axes(ax(1)); axis([1 N 0 850]);
text(5,700,'\textbf{(a)}','Interpreter','Latex',VA,'middle',HA,'left');
xlabel('Month number','Interpreter','Latex'); 
ylabel('Runoff, $10^{-2}$ in','Interpreter','Latex');
semilogx(ax(2),per,F.power,'-ok','LineWidth',1.5,'MarkerSize',5); 
axes(ax(2)); axis([1 300 0 0.55]);hold on;
plot(ax(2),[12 12],[0 1],'--k','LineWidth',0.5);
plot(ax(2),per(end)*[1 1],[0 1],'--k','LineWidth',0.5);
plot(ax(2),per(1)*[1 1],[0 1],'--k','LineWidth',0.5);
xlabel('Period, months','Interpreter','Latex'); ylabel('Normalised variance','Interpreter','Latex');
text(1.15,0.45,'\textbf{(b)}','Interpreter','Latex',VA,'middle',HA,'left');
text(12.5,0.5,'12 months','Interpreter','Latex',VA,'middle',HA,'left');
text(per(end)+0.1,0.5,'1/Nyquist','Interpreter','Latex',VA,'middle',HA,'left');
text(per(1)-1,0.5,'18 years~~','Interpreter','Latex',VA,'middle',HA,'right');

print -dpdf SeriesAndSpectrum_2
close(fig);
return;

%%%%%%%%%%%%%%%%%%%%%%
T = 10;  
A1 = 60;
A2 = 40;
f1 = 4/T;
f2 = 13/T;
t = linspace(0,T,2002);
y = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);
t = t(1:end-1);
y = y(1:end-1);
F = dfs(y);
N = length(y);
k = 1:(N-1)/2;
freq = k/T;

axw = 6;
axh = 1.5;
axls = 0.8;
axrs = 0.2;
axbs = 0.5;
axts = 0.1;
axms = 0.7;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+2*axh+axms+axts,'inches');
ax(1) = axes('Units','inches','position',[axls axbs+axh+axms axw axh]);
ax(2) = axes('Units','inches','position',[axls axbs axw axh]);
pl = plot(ax(1),t,y,'-k','LineWidth',1.5);
axes(ax(1)); xlabel('$t$, years','Interpreter','latex'); 
ylabel('$y$, Watts','Interpreter','Latex');
text(0.1,-75,'\textbf{(a)}','Interpreter','Latex',VA,'middle',HA,'left');
pl = plot(ax(2),freq(1:16),F.power(1:16),'-ok','LineWidth',1.5,'MarkerSize',10);
axes(ax(2)); xlabel('Frequency, yr$^{-1}$','Interpreter','Latex'); 
ylabel('Normalised variance','Interpreter','Latex');
text(0.02,0.7,'\textbf{(b)}','Interpreter','Latex',VA,'middle',HA,'left');
print -dpdf SeriesAndSpectrum_1
close(fig); clear
return

%%%%%%%%%%%%%%%%%%%%%%%%%
axw = 3;
axh = 3;
axls = 0.1;
axrs = 0.1;
axbs = 0.1;
axts = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh]);
N=9;
theta = linspace(0,2*pi,N+1);
theta = theta(1:end-1);
thetaf = linspace(0,2*pi,10000);
plot(cos(thetaf),sin(thetaf),'-k','LineWidth',0.5); hold on;
plot(cos(theta),sin(theta),'ok','LineWidth',1.5,'MarkerSize',10);
plot([-1.2 1.2],[0 0],'-k','LineWidth',0.5);
plot([0 0],[-1.2 1.2],'-k','LineWidth',0.5);
plot([0 cos(theta(2))],[0 sin(theta(2))],'--k','LineWidth',0.5);
for i=0:N-1
    label = ['$t_',num2str(i),'$'];
    x = 1.2*cos(theta(i+1));
    y = 1.2*sin(theta(i+1));
    if i==0; y=y+0.1; end;
    text(x,y,label,'Interpreter','Latex',VA,'middle',HA,'center');
end
text(1.1,0.4,'$\leftarrow$~~~time','Interpreter','Latex',VA,'middle',HA,'center','rotation',-65,'FontSize',10);
text(0.3,0.05,'$\theta_1$','Interpreter','Latex',VA,'bottom',HA,'left');
axis([-1.25 1.25 -1.25 1.25])
set(gca,'Visible','off');
print -dpdf CircularTimeseries
close(fig); clear
return


