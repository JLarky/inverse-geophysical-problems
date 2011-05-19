function d=d_gauss2(x,y,xm,s)
%Gaussian disrtibution (2-D) d=d_gauss2(x,xm,s)
% xm : mathematical expectation 
% s : variance
% x y : values of random variables
%*******************************
sx=size(x);
sx0=sx(1);
dss=sqrt(det(s));
s=inv(s);
for ik=1:sx0
   for jk=1:sx0
      xy=[x(ik,jk)-xm(1) y(ik,jk)-xm(2)];
      d(ik,jk)=(1.0 ./ (dss .* (2.0 .* pi)))...
      .* exp(-(1/2)* (xy * s * xy'));
   end
end