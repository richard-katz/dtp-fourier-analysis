clear; close all;

axw = 8;
axh = 1;
axls = 0.1;
axrs = 0.2;
axbs = 0.1;
axts = 0.2;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh]);
x = [-4.25 -4 -4 -3 -3 0 0 1 1 4 4 5 5 5.25];
y = [ 0  0  1  1  0 0 1 1 0 0 1 1 0 0];
plot(x,y,'-k','LineWidth',1.5); hold on;
plot([-10,10],[0 0],'-k','LineWidth',0.5);
plot([0,0],[-1 2],'-k','LineWidth',0.5);
axis([-4.5 5.5 -0.25 1.25])
set(gca,'Visible','off');
text(5.45,0.05,'$t$','Interpreter','Latex',HA,'left',VA,'bottom','FontSize',13);
text(0.05,1.23,'$f(t)$','Interpreter','Latex',HA,'left',VA,'bottom','FontSize',13);
text(-3,-0.1,'-3','Interpreter','Latex',HA,'center',VA,'top','FontSize',13);
text(1,-0.1,'1','Interpreter','Latex',HA,'center',VA,'top','FontSize',13);
text(4,-0.1,'4','Interpreter','Latex',HA,'center',VA,'top','FontSize',13);
text(5,-0.1,'5','Interpreter','Latex',HA,'center',VA,'top','FontSize',13);
print -dpdf IrregularSquareWaveFunction
close(fig); clear
return;

%%%%%%%%%%%%%%%%
axw = 8;
axh = 1;
axls = 0.1;
axrs = 0.2;
axbs = 0.1;
axts = 0.2;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh]);
x = [-10:10];
y = abs(mod(x,2));
plot(x,y,'-k','LineWidth',1.5); hold on;
plot([-10,10],[0 0],'-k','LineWidth',0.5);
plot([0,0],[-1 1],'-k','LineWidth',0.5);
plot([2,3],[-0.1 -0.1],'-k','LineWidth',1);
plot([3.7 3.7],[0 1],'-k','LineWidth',1);
axis([-9 9 -0.5 1]);
set(gca,'visible','off');
text(9,0.05,'$t$','Interpreter','Latex',HA,'left',VA,'bottom','FontSize',13);
text(0.05,1,'$f(t)$','Interpreter','Latex',HA,'left',VA,'bottom','FontSize',13);
text(2.5,-0.15,'$1$','Interpreter','Latex',HA,'center',VA,'top','FontSize',13);
text(3.77,0.75,'$1$','Interpreter','Latex',HA,'left',VA,'middle','FontSize',13);
print -dpdf JaggedFunction
close(fig); clear
return;

%%%%%%%%%%%%%%%%%
axw = 3;
axh = 3;
axls = 0.1;
axrs = 0.1;
axbs = 0.1;
axts = 0.1;
axcs = 0.2;
axms = 0.2;
figw = axls+2*axw+axcs+axrs;
figh = axbs+2*axh+axms+axts;
fig = figureForPrint(figw,figh,'inches');
ax(1) = axes('Units','inches','position',[axls axbs+axh+axms axw axh]); hold on;
ax(2) = axes('Units','inches','position',[axls+axw+axcs axbs+axh+axms axw axh]); hold on;
ax(3) = axes('Units','inches','position',[axls axbs axw axh]); hold on;
ax(4) = axes('Units','inches','position',[axls+axw+axcs axbs axw axh]); hold on;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
x = linspace(-1,1,10000);
y = zeros(size(x));
f = inline('4/pi*sin(j*pi*x)/j','j','x');
lab = {'\textbf{(a)}','\textbf{(b)}','\textbf{(c)}','\textbf{(d)}'};
for i=1:4
    y = y + f(2*i-1,x);
    if i==4; for j=9:2:39; y = y + f(j,x); end; end
    plot(ax(i),x,y,'k','LineWidth',1);
    plot(ax(i),[-1.1 1.1],[0 0],'k','LineWidth',0.5);
    plot(ax(i),[0 0],[-2 2],'k','LineWidth',0.5);
    plot(ax(i),[-1 0],-[1 1],'--k','LineWidth',0.5);
    plot(ax(i),[0 1],[1 1],'--k','LineWidth',0.5);
    set(ax(i),'xlim',[-1.1 1.1],'ylim',[-1.4 1.4]);
    if mod(i,2)==0; set(ax(i),'yticklabel',[]); end
    if i<3; set(ax(i),'xticklabel',[]); end;
    set(ax(i),'Xcolor','w','Ycolor','w');
    axes(ax(i));text(-0.95,0.95,lab{i},'Interpreter','Latex','FontSize',15);
    text(-0.05,1,'$1$','Interpreter','Latex','FontSize',13,HA,'right',VA,'middle');
    text(+0.05,-1,'$-1$','Interpreter','Latex','FontSize',13,HA,'left',VA,'middle');
    text(-1,0.05,'$-T/2$','Interpreter','Latex','FontSize',13,HA,'center',VA,'bottom');
    text(1,-0.05,'$T/2$','Interpreter','Latex','FontSize',13,HA,'center',VA,'top');
end
print -dpdf FourierSeriesConvergence
close(fig); clear
return;

%%%%%%%%%%%%%%%
axw = 3.5;
axh = 2;
axls = 0.3;
axrs = 0.1;
axbs = 0.4;
axts = 0.1;
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh]);
prs = 10;
x=[]; y=[];
for i=-prs/2:prs/2
    s = 2*mod(abs(i),2)-1;
    x = [x, i, i+1];
    y = [y, -s, -s];
end
plot(ax,x,y,'-k','LineWidth',1.5);
axis([-2.5 2.6 -1.5 1.6]);
set(gca,'xtick',[-5:5],'ytick',[-2:2],'xticklabel',[],'box','off'); grid on;
txt = {'$-T$','$-\frac{T}{2}$','$0$','$\frac{T}{2}$','$T$'};
for i=-2:2
    text(i,-1.6,txt(i+3),'FontSize',15,'Interpreter','Latex','HorizontalAlignment','center','VerticalAlignment','top')
end
text(2.6,-1.55,'$t$','FontSize',13,'Interpreter','Latex','HorizontalAlignment','center','VerticalAlignment','top')
text(-2.55,1.55,'$f$','FontSize',13,'Interpreter','Latex','HorizontalAlignment','right','VerticalAlignment','middle')
print -dpdf SquareWave
close(fig); clear