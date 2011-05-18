% Script d0bin.m
% binomial disrtibution 
% call function d=d_bin(n,p)
% n : n=1,2,...; - maximum value of argument x
%                  x=0,1,...,n
% p : 0 < p < 1 - parameter of distribution
% d : row vector, returns the density function
%
% To calculate density function for different values of the
% parameters:
%
%p=0.2,0.5,0.8;
%
%n=1,5,10,50.
% Please to pay attention for the coincidence with 
% the Gaussian distribution.
%
% Please to pay attention to the output at the 
% MATLAB COMMAND WINDOW.
%
clear
%******************** INPUT ********************
n=50; %maximum value of argument
p=1.0; %parameter of distribution
%******************** END INPUT*****************
%
d=d_bin(n,p);
x=0:n;
% graphic representation
figure(1)
rect=[0.1 0.1 .8 0.5];          % size of figure
axes('position',rect)
stem(x,d);
%plot(x,d);
comp_prob=sum(d)
math_exp= n .* p 
stand_dev=sqrt(n .* p .* (1-p))
m1=sum(x.*d)
s1=sqrt(sum((x-m1).^2.*d))
hold on
dn=d_gauss(x,math_exp,stand_dev);
plot(x,dn,'g');
xlabel('Number of succesful attempts')
ylabel('Probability')
title({['Binomial distribution (n = ' num2str(n) ', p = ' num2str(p) ')'] ; ['math exp = ' num2str(math_exp) ', stand dev = ' num2str(stand_dev)] ; ['m1 = ' num2str(m1) ', s1 = ' num2str(s1)]})
%print -dps f0bin1.ps