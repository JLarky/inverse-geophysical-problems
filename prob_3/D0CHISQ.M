%Script d0chisq.m
%density function for chi square disrtibution 
% call  d=d_chisq(x,n)
% n : number of degree of freedom
% x : random variable,   a < x < b
% d : row vector, returns the density function
%
% To compare chi-square distribution for different values of the 
% degrees of freedom with the Gaussian distribution
%(n=2, 5, 10, 50).
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
%
clear
%******************** INPUT ********************
n=250
%    determination of interval at x axis
a=eps;           % (a < x < b)
b=200.0;
nx=1000;           %number of samples
%******************** END INPUT*****************
del=(b-a)/(nx-1);   % determination of a bin
x=a:del:b;
%
d=d_chisq(x,n);
%
%stem(x,d);
plot(x,d);   % graphic presentation
comp_prob=trapz(x,d)
math_exp=n 
stand_dev=sqrt(2 .* n)
m1=trapz(x,x.*d)
s1=sqrt(trapz(x,(x-m1).^2.*d))
hold on
dn=d_gauss(x,math_exp,stand_dev);
plot(x,dn,'g');
xlabel('Value')
ylabel('Probability density')
title({['Chi-square distribution (n = ' num2str(n) ')'] ; ['m = ' num2str(math_exp) ', dev = ' num2str(stand_dev)] ;  ['m1 = ' num2str(m1) ', s1 = ' num2str(s1)] } )
%print -dps f0chsq1.ps
