%Script d0gauss2.m
%Gaussian disrtibution 
% call d_gauss2(x,xm,s)
%*******************************
% xm : mathematical expectation 
% s : variance
% x : random variable
%*******************************
% To calculate the 2-dimensional Gaussian distribution 
% for different  values of the parameters:
%
% xm=[0.0 0.0];
% s=[9.0 0.0; 0.0 9.0];
%
% xm=[0.0 0.0];
% s=[25.0 0.0; 0.0 25.0];
%
% xm=[2.0 2.0];
% s=[9.0 0.0; 0.0 9.0];(correlation coefficient = 0)
%
% xm=[0.0 0.0];
% s=[16.0 8.; 8.0 16.0];(correlation coefficient = 0.5)
%
% xm=[0.0 0.0];
% s=[16.0 -8.; -8.0 16.0];(correlation coefficient = -0.5)
%
% xm=[0.0 0.0];
% s=[16.0 12.; 12.0 16.0]; (correlation coefficient = 0.75)
%
% xm=[0.0 0.0];
% s=[16.0 15.2; 15.2 16.0]; (correlation coefficient = 0.95)
%
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
clear
%******************** INPUT ********************
m1=0.0;
m2=2.0;
xm=[m1 m2];  %mathematical expectation
d1=1.0;
d2=1.0;
r12=0.5;
r21=0.5;
s=[d1 r12; r21 d2];  %covariance matrix
a=-5.0; % a,b - data for determination of an interval on x y axis
b=5.0;
nx=100; %number of samples at x and y axis
%******************** END INPUT*****************
% determination of a bin
del=(b-a)/(nx-1);
[x,y]=meshgrid(a:del:b,a:del:b);
d=d_gauss2(x,y,xm,s);
%mesh(x,y,d);
%figure(1)
%surf(x,y,d);
%title('2-D Gaussian density function')
%print -dps f0gaus21.ps
figure(2)
contour(x,y,d);
%print -dps f0gaus22.ps
math_exp=xm
cor_matrix=[s(1,1)/s(1,1) s(1,2)/sqrt(s(1,1)*s(2,2));...
s(2,1)/sqrt(s(2,2)*s(1,1)) s(2,2)/s(2,2)]
st_dev=[sqrt(s(1,1)) sqrt(s(2,2))]

xlabel('x probability density')
ylabel('y probability density')
title({['2-D Gaussian density function'] ;[ 'm1 = ' num2str(m1) ', m2 = ' num2str(m2) '; d1 = ' num2str(d1) ', d2 = ' num2str(d2) '; r12 = ' num2str(r12) ', r21 = ' num2str(r21)] } )
