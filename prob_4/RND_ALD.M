function q=rnd_ald(dtp,n,nr,p)
% dtp=1  %Binomial         disrtibution d=d_bin(n,x1) 
% dtp=2  %Geometrical      disrtibution d=d_geom(n,x1)
% dtp=3  %Hypergeometrical disrtibution d=d_hypg(n,n1,n2)  
% dtp=4  %Poisson          disrtibution d=d_poiss(n,x1) 
%
%  
% relative error for numerical evaluation of the 
% distribution function
%
if dtp==1
%switch dtp
%   case 1      % Binomial 
      x1=p(1);
end
if dtp==2
%   case 2      % Geometrical   
      x1=p(1);
end
if dtp==3
%   case 3      % Hypergeometrical
      n1=p(1);
      n2=p(2);
end
if dtp==4
%   case 4      % Poisson
      x1=p(1);
end
%otherwise
%end
x=[0:n];
%   switch dtp
if dtp==1
%      case 1
      d=d_bin(n,x1);
      d=cumsum(d);
      math_exp= n .* x1 
      stand_dev=sqrt(n .* x1 .* (1-x1))
      raspr=['Binomial, n = ' num2str(n) ', p = ', num2str(x1)];
      mdev=['mathexp = ' num2str(math_exp) ', stdev = ' num2str(stand_dev) ')']
end
if dtp==2
%      case 2
      d=d_geom(n,x1);
      d=cumsum(d);
      
end
if dtp==3
%      case 3
      d=d_hypg(n,n1,n2);
      d=cumsum(d);
end
if dtp==4
%      case 4
      d=d_poiss(n,x1);
      d=cumsum(d);
      math_exp= x1 
      stand_dev=sqrt(x1)
      raspr=['Poisson, maxsize = ' num2str(n) ', a = ', num2str(x1)];
      mdev=['mathexp = ' num2str(math_exp) ', stdev = ' num2str(stand_dev) ')']
end
%   otherwize
%   end
%end
%plot(x,d,'g');
figure(1)
stairs(x,d);
title({['Distribution function (' raspr ')'] ; mdev})
xlabel('Probability')
ylabel('Value')
%pause
%
ind=1;
if nr <= 0 | n <= 1  
   ind=0;
end 
if ind==1
   q=zeros(1,nr);
   r=rand(1,nr);
   for   ik=1:nr
      m=0;
      while r(ik)-d(m+1) > 0 
         m=m+1;
      end
      q(ik)=m;
   end
else
   pause
end
