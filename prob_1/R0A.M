% Script r0a.m
% Examples of random values
% This script creates the (uncorrelated) time series
% with uniform or normal distributed values:
%
% indd=1 - uniform distribution at interval (0,1);
%
% indd=2 - Gaussian distribution (N(0,1)).
%
% One can see on similar time series as the simple model,
% for example, of seismic trace.
clear
%******************** INPUT ********************
indd=2;
m=250;           % sample size
%******************** END INPUT*****************
n=1:m;                    % row vector   
if indd==1
   s=rand(1,length(n));   % row vector
else
   s=randn(m,1);          % column vector
   s=s'                   % row vector
end
rect=[0.1 0.1 .8 0.5];          % size of figure
axes('position',rect)
stem(n,s);          % graphic presentation