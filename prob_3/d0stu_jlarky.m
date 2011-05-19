%Script d0stu.m
%density function for Student disrtibution 
% call d=d_stu(x,n)
% n :  parameter of distribution
% x : value of random variable
%
% To calculate the Student distribution for different
% values of the parameter:
% n=3,5,10,20,50;
% Please compare the presentation of the density functions
% for different values of parameter and with 
% Gaussian density function.
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
clear
%******************** INPUT ********************
n=100
%    determination of interval at x axis
a=-10.0;         % (a < x < b)
b=10.0;
nx=10000;   %number of samples
%******************** END INPUT*****************
h=figure(1);
del=(b-a)/(nx-1);   % determination of a bin
x=a:del:b;
d=d_stu(x,n);
plot(x,d);
comp_prob=trapz(x,d)
math_exp=0
stand_dev=sqrt(n./(n-2))
m1=trapz(x,x.*d)
s1=sqrt(trapz(x,(x-m1).^2.*d))
hold on
dn=d_gauss(x,math_exp,stand_dev);
plot(x,dn,'g');
xlabel('Value')
ylabel('Probability density')
title({['Student distribution (n = ' num2str(n) ')'] ; ['m = ' num2str(math_exp) ', dev = ' num2str(stand_dev)] ;  ['m1 = ' num2str(m1) ', s1 = ' num2str(s1)] } )

%print -dps f0stu1.ps

set(gcf,'PaperUnits','centimeters');
xSize = 16; ySize = 8;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize]);
saveas(h,['stu_' int2str(n) '.png']);