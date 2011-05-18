%Scripr d0gauss.m 
%density function for Gaussian disrtibution 
% call d=d_gauss(x,xm,s)
% xm : mathematical expectation 
% s : variance
% x : random variable
%
% To calculate the Gaussian distribution for different
% values of the parameters:
% xm=-5,-2,0,2,5;
% s=1,2,3,4,5.
% To calculate the distribution for combinations of these values
% of parameters.
%
% Please compare the presentation of the density functions
% for different combinations of parameters.
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
clear
%******************** INPUT ********************
xm=0.0;
s=2.0;
%    determination of interval at x axis
a=-10.0;    % (a < x < b)
b=10.0;
nx=100  %number of samples
%******************** END INPUT*****************
del=(b-a)/(nx-1);  % determination of a bin
x=a:del:b;
d=d_gauss(x,xm,s);
plot(x,d);
title('Gaussian distribution')
%print -dps f0gauss1.ps
comp_prob=trapz(x,d)
math_exp=xm
stand_dev=sqrt(s^2)
m1=trapz(x,x.*d)
s1=sqrt(trapz(x,(x-m1).^2.*d))
