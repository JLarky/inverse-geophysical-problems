% Script p0hist.m
% Creation of histogram for random numbers belonging to
% the gaussian distribution.
% call function  d=randn(1,nr)
%                [n,x]=hist(d,x)
%                d=d_gauss(x,0,1);
% The histogram characterizes the probability properties
% of a random variable.
% Using this script to investigate proximity of histogram
% and Gaussian density function for the next parameters of
% the histogram:
%
% sample size
% (nr=10, 100, 500);
%
% number of the bins
% (del=0.5, 2.0).
% 
clear
%******************** INPUT ********************
nr=5000;          %sample size
del=0.001;     %input of bin at x-coordinate
a=-5; %lower limit of histogram
b=5; %upper limit of histogram
%******************** END INPUT*****************
x=a:del:b;  % creation of bins at x-coordinate
d=randn(1,nr);    % row vector
%d1=sort(d);
%hist(d,x);           % presentation of histogram
[n,x]=hist(d,x);
h=figure(1);
%subplot(2,2,1),
bar(x,n./(nr.*del));  %presentation of the normalized histogram
hold on
d2=normpdf(x,0,1);     %Gaussian density function  (row vector)
%subplot(2,2,1),
plot(x,d2,'g')   %graph presentation of Gaussian density function       
title(['Histogram and distribution d=' num2str(del) ', n=' int2str(nr) ])
%print -dps f0hist1.ps

set(gcf,'PaperUnits','centimeters')
xSize = 16; ySize = 8;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize]);
saveas(h,['hist_' regexprep(num2str(del), '(\.)',',') '_' int2str(nr) '.png'])