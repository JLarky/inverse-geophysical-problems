function d=d_gauss(x,xm,s)
%Gaussian disrtibution d=d_gauss(x,xm,s)
% xm : mathematical expectation 
% s : variance
% x : value of random variable
%*******************************
d=(1.0 ./ (s .* sqrt(2.0 .* pi)))...
.* exp(-(x-xm).^2/(2.0 .* s .^2));


