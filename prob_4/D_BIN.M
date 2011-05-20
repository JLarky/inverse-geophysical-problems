function d=d_bin(n,p);
%Binomial disrtibution d=d_bin(n,p)
% n : n=1,2,...; - maximum value of argument x
%                  x=0,1,...,n
% p : 0 < p < 1 
%
n1=prod(1:n);
for m=0:n
   if m==0
      m1=1;
   else
      m1=prod(1:m);
   end
   nm=n-m;
   if nm==0
      nm1=1;
   else
      nm1=prod(1:nm);
   end
   d(m+1)=(n1/(m1*nm1))*p^m * (1-p)^nm;
end
