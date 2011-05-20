function d=d_poiss(n,a)
%Poisson disrtibution d=d_poiss(n,a)
% n : maximum value of discrete random value n=0,1,...
% a : 
%*******************************
for m=0:n
   if m==0
      m1=1;
   else
      m1=prod(1:m);
   end
   d(m+1)=((a.^m)/(m1))*exp(-a);
end

