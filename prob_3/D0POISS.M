%Script d0poiss.m
% density function for Poisson disrtibution 
% call d=d_poiss(n,a)
% n : n=0,1,2,... 
% a : a > 0
%
% To calculate the Poisson distribution for different
% values of the parameter:
% a=0.1,0.5,1,2,5,10,20;
% Please compare the presentation of the density functions
% for different values of parameters.
%
% Please compare the presentation of the density functions
% for different parameters with  Gaussian density function.
%
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.

clear
%******************** INPUT ********************
a=100; %parameter of distribution
n=100; %upper limit for argument
%******************** END INPUT*****************
%
d=d_poiss(n,a);
%
% graphic presentation
rect=[0.1 0.1 .8 0.5];          % size of figure
axes('position',rect)
nn=0:n;
stem(nn,d);
comp_prob=sum(d)
math_exp= a 
stand_dev=sqrt(a)
m1=sum(nn.*d)
s1=sqrt(sum((nn-m1).^2.*d))
hold on
dn=d_gauss(nn,math_exp,stand_dev);
plot(nn,dn,'g');
xlabel('Value')
ylabel('Probability density')
title({['Poisson distribution (a = ' num2str(a) ', max arg = ' num2str(n) ')'] ; ['m = ' num2str(math_exp) ', dev = ' num2str(stand_dev)] ;  ['m1 = ' num2str(m1) ', s1 = ' num2str(s1)] } )
%print -dps f0poiss1.ps