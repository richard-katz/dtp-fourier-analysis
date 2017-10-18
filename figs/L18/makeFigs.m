clear; close all;

X = [-10 -2 -1 -0.3 0.5 0.501 3    3.001 10];
Y = [  0  0  1  0   0   1.35  1.35 0     0];
x = linspace(-10,10,1001);
y = interp1(X,Y,x,'linear');
t = 100*[0 1 10 100];

F = dft(y);
k = [1:length(F.alpha)]/length(F.alpha);

axw = 5;
axh = 3;
axl = 0.1;
axr = 0.1;
axb = 0.1;
axt = 0.1;
axs = 0.2;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(2*axw+3*axs,2*axh+3*axs,'inches');
ax(1) = axes('Units','inches','position',[axs 2*axs+axh       axw axh]); hold on;
ax(2) = axes('Units','inches','position',[2*axs+axw 2*axs+axh axw axh]); hold on;
ax(3) = axes('Units','inches','position',[axs axs             axw axh]); hold on;
ax(4) = axes('Units','inches','position',[2*axs+axw axs       axw axh]); hold on;
letr = 'abcd';

for i=1:length(t)
  ke = exp(-k.^2*t(i));
  A.alpha  = F.alpha.*ke;
  A.beta   = F.beta .*ke;
  A.alpha0 = F.alpha0;
  S = idfs(A);
  plot(ax(i),x,S,'-k','linewidth',1.5);
  le{i} = ['\textbf{(',letr(i),')} $\kappa\,t=',num2str((t(i)-t(1))/t(2)),'$~~~~'];
  plot(ax(i),[-6 6],[0 0],'-k');
  plot(ax(i),[0 0],[-2 2],'-k');
  set(ax(i),'visible','off','xlim',[-6 6],'ylim',[-0.1 1.5]);
  axes(ax(i)); text(-3,1.3,le{i},'interpreter','latex','fontsize',18,HA,'center',VA,'middle')
end

print -dpdf decayFourierOscillations
close all;
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
x = linspace(-3.2,3.2,100000);
t = [0 0.0002 0.005 0.8];
lam = [6 0.5 0.1]/2/pi;
A   = [1 0.5 0.4];

axw = 5;
axh = 3;
axl = 0.1;
axr = 0.1;
axb = 0.1;
axt = 0.1;
axs = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(2*axw+3*axs,2*axh+3*axs,'inches');
ax(1) = axes('Units','inches','position',[axs 2*axs+axh       axw axh]); hold on;
ax(2) = axes('Units','inches','position',[2*axs+axw 2*axs+axh axw axh]); hold on;
ax(3) = axes('Units','inches','position',[axs axs             axw axh]); hold on;
ax(4) = axes('Units','inches','position',[2*axs+axw axs       axw axh]); hold on;
letr = 'abcd';

for i=1:length(t)
  y = A(1)*exp(-t(i)/lam(1)^2)*sin(x/lam(1)) + ...
      A(2)*exp(-t(i)/lam(2)^2)*cos(x/lam(2)) + ...
      A(3)*exp(-t(i)/lam(3)^2)*sin(x/lam(3));
  plot(ax(i),x,y,'-k','linewidth',1.5);
  le{i} = ['\textbf{(',letr(i),')} $\kappa\,t=',num2str(t(i)/t(2)),'$~~~~'];
  plot(ax(i),[-3.2 3.4],[0 0],'-k');
  plot(ax(i),[0 0],[-2 2],'-k');
  set(ax(i),'visible','off','xlim',[-3.3 3.4],'ylim',[-1.9 1.9]);
  axes(ax(i)); text(-1.5,1,le{i},'interpreter','latex','fontsize',18,HA,'center',VA,'middle')
end

print -dpdf decayThreeOscillations
close all;

return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
x = linspace(-3.2,3.2,1000);
t = [0 1 2];

axw = 5;
axh = 3;
axls = 0.1;
axrs = 0.1;
axbs = 0.1;
axts = 0.1;
HA = 'HorizontalAlignment';
VA = 'VerticalAlignment';
fig = figureForPrint(axls+axw+axrs,axbs+axh+axts,'inches');
ax = axes('Units','inches','position',[axls axbs axw axh]); hold on;

for i=1:length(t)
  pl(i) = plot(x,exp(-t(i))*sin(pi*x),'color',1.5*[1 1 1]*(i-1)/(length(t)+1),'linewidth',1.5);
  le{i} = ['$(2\pi/\lambda)^2\kappa\,t=',num2str(t(i)),'$~~~~'];
end
plot([-3.2 3.4],[0 0],'-k');
plot([0 0],[-1.1 1.2],'-k');
axis([-3.3 3.4 -1.2 1.3]);
set(gca,'visible','off');
text(0.55,1.05,'$\rightarrow$','Interpreter','latex','fontsize',17,HA,'left')
text(0.45,1.05,'$\leftarrow$','Interpreter','latex','fontsize',17,HA,'right')
text(1.55,-1.05,'$\leftarrow$','Interpreter','latex','fontsize',17,HA,'left')
text(1.45,-1.05,'$\rightarrow$','Interpreter','latex','fontsize',17,HA,'right')
text(-0.05,1.15,'$T$','Interpreter','latex','fontsize',13,HA,'right',VA,'bottom')
text(3.35,0.05,'$y$','Interpreter','latex','fontsize',13,HA,'left',VA,'bottom')
text(0.48,0.7,'$\Rightarrow$','Interpreter','latex','fontsize',17,HA,'center',VA,'middle','rotation',-90)
text(1.52,-0.7,'$\Rightarrow$','Interpreter','latex','fontsize',17,HA,'center',VA,'middle','rotation',90)
leg = legend(pl,le,'Location','NorthOutside','Orientation','horizontal');
set(leg,'interpreter','latex','FontSize',12,'box','off');

print -dpdf decayOscillations
close all;