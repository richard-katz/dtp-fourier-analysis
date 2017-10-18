clear; close all;

T = 100;
N = 1001;
t = linspace(0,T,N+1)';
y = cos(2*pi*t*5/T)+0.5*sin(2*pi*t*12/T)-15*(t/T).^3+0.4*randn(size(t));
%m1 = fit(t,y,'poly1');
%m2 = fit(t,y,'poly2');

p1 = polyfit(t,y,1);
p2 = polyfit(t,y,2);

axw = 6;
axh = 3;
axl = 0.7;
axr = 0.2;
axb = 0.5;
axt = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axl+axw+axr,axb+axh+axt,'inches');
ax  = axes('Units','inches','position',[axl axb axw axh]); hold on;
pl(1) = plot(ax,t,y,'-k','linewidth',1); 
pl(2) = plot(t,p1(1)*t+p1(2),':k','LineWidth',1);
pl(3) = plot(t,p2(1)*t.^2+p2(2)*t+p2(3),'--k','LineWidth',1);
set(ax,'box','on');
xlabel('Time, years','Interpreter','latex','FontSize',15);
ylabel('Amplitude','Interpreter','latex','FontSize',15);
leg = legend(pl,'Time-series','Linear fit: $y=p_1t+p_2$','Quadratic fit: $y=q_1t^2 + q_2t + q_3$~~~');
set(leg,'box','off','Interpreter','latex','FontSize',14,'location','southwest');
print -dpdf QuadDetrend;
close all; clear;
return;

%%%%%%%%%%%%%%%%%%%
A = 0.07;
t = linspace(0,2*pi,1000);
xo = cos(t);
yo = sin(t);
x = (1+A*cos(6*t)).*cos(t);
y = (1+A*cos(6*t)).*sin(t);

axw = 2;
axh = 2;
axs = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(5*axs+4*axw,2*axs+axh,'inches');
ltr='abcd';
for i=1:4
    ax(i) = axes('Units','inches','position',[i*axs+(i-1)*axw axs axw axh]);
    plot(ax(i),xo,yo,'--k','LineWidth',0.5); hold on;
    %plot(ax(i),(1+A*cos((i+1)*(t+pi/(i+1)))).*xo,(1+A*cos((i+1)*(t+pi/(i+1)))).*yo,...
    %     '-','LineWidth',1.5,'color',[0.9 0.9 0.9]);
    plot(ax(i),(1+A*cos((i+1)*t)).*xo,(1+A*cos((i+1)*t)).*yo,'-k','LineWidth',1.5);
    axis(ax(i),[-1.1 1.1 -1.1 1.1])
    set(ax(i),'visible','off'); axis equal;
    text(-1,1,['\textbf{(',ltr(i),')}'],'Interpreter','latex',HA,'center',VA,'middle');
end
set(gcf,'color','w');

print -dpdf HoopNormalModes; 
close all; clear;
return;

%%%%%%%%%%%%%%%%%%%%
x = linspace(0,2*pi,1000);
y1 = sin(0.5*x);
y2 = sin(1*x);
y3 = sin(1.5*x);
y4 = sin(2*x);

axw = 7;
axh = 0.5;
axls = 0.1;
axrs = 0.1;
axbs = 0.1;
axts = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax  = axes('Units','inches','position',[axls axbs axw axh]);
%plot(ax,x,-y1,'-k','LineWidth',1,'color',[0.9 0.9 0.9]); hold on;
%plot(ax,x,-y2,'-k','LineWidth',1,'color',[0.9 0.9 0.9]); hold on;
%plot(ax,x,-y3,'-k','LineWidth',1,'color',[0.9 0.9 0.9]); hold on;
%plot(ax,x,-y4,'-k','LineWidth',1,'color',[0.9 0.9 0.9]); hold on;
plot(ax,x,y1,'-k','LineWidth',1); hold on;
plot(ax,x,y2,'-k','LineWidth',1); hold on;
plot(ax,x,y3,'-k','LineWidth',1); hold on;
plot(ax,x,y4,'-k','LineWidth',1); hold on;
plot(ax,[0 2*pi],[0 0],'ok','MarkerSize',8,'MarkerFaceColor','k');
axis([-0.1 2*pi+0.1 -1.1 1.1]);
set(gca,'visible','off');

print -dpdf NormalModes
close all; clear; return;

%%%%%%%%%%%%%%%%%
T = 100;
N = 1001;
t = linspace(0,T,N+1);
y = 2*cos(2*pi*t*5/T) + sin(2*pi*t*12/T) + 8*t/T + 0.4*randn(size(t));
F = dfs(y(1:end-1));
k = [1:(N-1)/2];
ydt = y - 8/T*t;
Fdt = dfs(ydt(1:end-1));

axw = 6;
axh = 2;
axls = 0.6;
axrs = 0.2;
axbs = 0.5;
axts = 0.1;
axms = 0.6;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+3*axh+2*axms+axts,'inches');
ax(1) = axes('Units','inches','position',[axls axbs+2*(axh+axms) axw axh]);
ax(2) = axes('Units','inches','position',[axls axbs+axh+axms axw axh]); hold on;
ax(3) = axes('Units','inches','position',[axls axbs axw axh]); hold on;
plot(ax(1),t,y,'-k','LineWidth',1.5);
plot(ax(2),k,F.alpha,'-ko','LineWidth',1,'MarkerSize',8);
plot(ax(2),k,F.beta,'-kx','LineWidth',1,'MarkerSize',8);
plot(ax(2),[5 5],[-3 3],':k',[12 12],[-3 3],':k'); 
plot(ax(2),[120 180],[2.3 2.3],'-k','LineWidth',1);
plot(ax(2),[120 180],[1.7 1.7],'-k','LineWidth',1);
plot(ax(2),[150],[2.3],'ok','LineWidth',1,'MarkerSize',8);
plot(ax(2),[150],[1.7],'xk','LineWidth',1,'MarkerSize',8);
plot(ax(3),k,Fdt.alpha,'-ko','LineWidth',1,'MarkerSize',8); 
plot(ax(3),k,Fdt.beta,'-kx','LineWidth',1,'MarkerSize',8);
plot(ax(3),[5 5],[-3 3],':k',[12 12],[-3 3],':k'); 
plot(ax(3),[120 180],[2.4 2.4],'-k','LineWidth',1);
plot(ax(3),[120 180],[2.0 2.0],'-k','LineWidth',1);
plot(ax(3),[150],[2.4],'ok','LineWidth',1,'MarkerSize',8);
plot(ax(3),[150],[2.0],'xk','LineWidth',1,'MarkerSize',8); hold off;

axes(ax(1));
axis([0 100 -5 15]);
xlabel('Time, years','Interpreter','Latex');
ylabel('Amplitude','Interpreter','Latex');
text(2,13,'\textbf{(a)}','Interpreter','Latex',HA,'left',VA,'middle')
axes(ax(2));
axis([1 500 -3 3]); set(ax(2),'xscale','log','box','on');
xlabel('Harmonic number, k','Interpreter','Latex');
ylabel('Coef.~amplitude','Interpreter','Latex');
text(1.1,2.5,'\textbf{(b)}','Interpreter','Latex',HA,'left',VA,'middle')
text(200,2.5,{'$\alpha_k$','$\beta_k$'},'Interpreter','Latex',HA,'left',VA,'top');

axes(ax(3));
axis([1 500 -0.5 3]); set(ax(3),'xscale','log','box','on');
xlabel('Harmonic number, k','Interpreter','Latex');
ylabel('Coef.~amplitude','Interpreter','Latex');
text(200,2.5,{'$\alpha_k$','$\beta_k$'},'Interpreter','Latex',HA,'left',VA,'top');
text(1.1,2.7,'\textbf{(c)}','Interpreter','Latex',HA,'left',VA,'middle')

print -dpdf TimeSerWithTrend
close all; clear;
