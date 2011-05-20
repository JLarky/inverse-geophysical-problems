function d=d_chisq(x,n)
%Chi squre disrtibution d=d_chisq(x,n)
% n : number of degree of freedom 
% x : 0 < x < inf
% d : row vector, returns the density function
%*******************************
d=((x./2).^((n./2)-1).*exp(-x ./ 2))/(2.*gamma(n./2));


