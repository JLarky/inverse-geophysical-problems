%Script
%density function for uniform disrtibution 
% call d=d_unif(x,al,bt)
% x : if x > bt or x < al then d=0 
% al : lower limit of argument
% bt : upper limit of argument
%           bt > al 
% To calculate the uniform distribution for different
% values of the parameters:
% al=2, bt=5;
% al=2, bt=10;
% al=2, bt=20;
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
%
clear
%******************** INPUT ********************
al=0;
bt=1;
% creation the interval for presentation
a=al-(bt-al)./2;
b=bt+(bt-al)./2;
nx=100000;     %number of samples
%********************* END INPUT ***************
h=figure(1);
% determination of samples
del=(b-a)/(nx-1);
x=a:del:b;
%
d=d_unif(x,al,bt);
%
% graphic presentation
plot(x,d);
axis([-1 2 0 1.1]);
%print -dps f0unif1.ps
comp_prob=trapz(x,d)
math_exp=(al+bt)./2
stand_dev=sqrt((bt-al).^2./12)
m1=trapz(x,x.*d)
s1=sqrt(trapz(x,(x-m1).^2.*d))
xlabel('Value')
ylabel('Probability density')
title({['Uniform distribution (a = ' num2str(al) ', b = ' num2str(bt) ', nx = ' num2str(nx) ')'] ; ['m = ' num2str(math_exp) ', dev = ' num2str(stand_dev)] ;  ['m1 = ' num2str(m1) ', s1 = ' num2str(s1)] } )

set(gcf,'PaperUnits','centimeters');
xSize = 16; ySize = 8;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize]);
saveas(h,['unif_' int2str(a) '_' int2str(b) '.png']);