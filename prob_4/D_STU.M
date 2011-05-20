function d=d_stu(x,n)
%Student disrtibution d=d_stu(x,n)
% n :  
% t : value of random variable
%*******************************
d=gamma((n+1)./2)/(sqrt(n*pi).*gamma(n/2))...
.* (1+x.^2/n).^(-(n+1) ./ 2);


