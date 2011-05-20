function d=rnd_alc(dtp,b,nint,nr,p)
% d : vector with a batch of numbers
% dtp : type of distribution
% b : interval for creation of the distribution function
% nint : number of samples for creation of 
%        the distribution function
% nr : sample size
% p : vector of the  parameters of the distribution
%*****************************************
% dtp=1  % Cauchy      distribution     d=d_cauch(x)
% dtp=2  % Chi square  distribution     d=d_chisq(x,n)
% dtp=3  % Exponential distribution     d=d_expon(x,l)
% dtp=4  % Fisher      disrtibution     d=d_fish(x,n1,n2)  
% dtp=5  % Gaussian    disrtibution     d=d_gauss(x,xm,s)
% dtp=6  % Laplace     disrtibution     d=d_lapl(x,l)
% dtp=7  % Logarithmic normal 
%                      distribution     d=d_lnorm(x,xm,s)
% dtp=8  % Snedecor    disrtibution     d=d_sned(x,n1,n2)
% dtp=9  % Student     disrtibution     d=d_stu(x,n)
% dtp=10 % Beta        distribution     d=d_beta(x,al,bt)
% dtp=11 % Gamma       distribution     d=d_gam(x,al,bt)
% dtp=12 % Uniform     distribution     d=d_unif(x,al,bt)
%
% 
tol=0.0001; %relative error for numerical evaluation of the
%            distribution function
%
if dtp==1
%switch dtp
%   case 1      % Cauchy 
      a=-b;
end
if dtp==2
%   case 2      % Chi square
      n=p(1);
      a=0.0;
      math_exp=n 
      stand_dev=sqrt(2 .* n)
      raspr=['Chi-square, n = ' num2str(n)]; 
      mdev=['mathexp = ' num2str(math_exp) ', stdev = ' num2str(stand_dev)]
%      n=4.0;
end
if dtp==3
%   case 3      % Exponential
      l=p(1);      
      a=0.0;
%      l=1.0
end
if dtp==4
%   case 4      % Fisher
      n1=p(1);
      n2=p(2);
      a=-b;
%      n1=50.0;
%      n2=50.0;
end
if dtp==5
%   case 5      % Gaussian
      xm=p(1);
      s=p(2);
      a=-b;
      raspr=['Gaussian, m = ' num2str(xm) ', stdev = ' num2str(s)]; 
      mdev=' '
%      xm=2.0;
%      s=4.0;
end
if dtp==6
%   case 6      % Laplace
      l=p(1);
      a=-b;
%      l=1.0;
end
if dtp==7
%   case 7      % Logarithmic normal
      xm=p(1);
      s=p(2);
      a=eps;
%      xm=2.0;
%      s=0.5;
end
if dtp==8
%   case 8      %Snedecor
      n1=p(1);
      n2=p(2);
      a=eps;
%      n1=20;
%      n2=20;
end
if dtp==9
%   case 9      % Student
      n=p(1);
      a=-b;
      math_exp=0;
      stand_dev=sqrt(n./(n-2));
      raspr=['Student, n = ' num2str(n)]; 
      mdev=['mathexp = ' num2str(math_exp) ', stdev = ' num2str(stand_dev)];
%      n=2;
end
if dtp==10
%   case 10      % Beta
      al=p(1);
      bt=p(2);
      a=0;
      b=1;
%      al=20;
%      bt=20;
end
if dtp==11
%   case 11      % Gamma
      al=p(1);
      bt=p(2);
      a=0;
%      al=20;
%      bt=20;
end
if dtp==12
%   case 12      % Uniform
      al=p(1);
      bt=p(2);
      a=-b;
      math_exp=(al+bt)./2
      stand_dev=sqrt((bt-al).^2./12)
      raspr=['Uniform, a = ' num2str(al) ', b = ' num2str(bt)]; 
      mdev=['mathexp = ' num2str(math_exp) ', stdev = ' num2str(stand_dev)];
%      al=2;
%      bt=20;
end
%otherwise
%end
del=(b-a)/(nint-1);
ss=0;
for ik=1:nint
   a1=a+del .* (ik-1);
   b1=a1+del;
   x(ik)=b1;
%   switch dtp
if dtp==1
%      case 1
      q=quadl('d_cauch',a1,b1,tol,0);
end
if dtp==2
%      case 2
      q=quadl('d_chisq',a1,b1,tol,0,n);
end
if dtp==3
%      case 3
      q=quadl('d_expon',a1,b1,tol,0,l);
end
if dtp==4
%      case 4
      q=quadl('d_fish',a1,b1,tol,0,n1,n2);
end
if dtp==5
%      case 5
      q=quadl('d_gauss',a1,b1,tol,0,xm,s);
end
if dtp==6
%      case 6
      q=quadl('d_lapl',a1,b1,tol,0,l);
end
if dtp==7
%      case 7
      q=quadl('d_lnorm',a1,b1,tol,0,xm,s);
end
if dtp==8
%      case 8
      q=quadl('d_sned',a1,b1,tol,0,n1,n2);
end
if dtp==9
%      case 9
      q=quadl('d_stu',a1,b1,tol,0,n);
end
if dtp==10
%      case 10
      q=quadl('d_beta',a1,b1,tol,0,al,bt);
end
if dtp==11
%      case 11
      q=quadl('d_gam',a1,b1,tol,0,al,bt);
end
if dtp==12
%      case 12
      q=quadl('d_unif',a1,b1,tol,0,al,bt);
end
%   otherwize
%   end
   ss=ss+q;
   d(ik)=ss;
end
plot(x,d,'g');
title({['Cumulative distribution function (' raspr ')']; mdev});
xlabel('Value');
ylabel('Probability');
%print -dps f_ralc1.ps
d(1)=0;
d(nint)=1;
table=[x;d];
table=table';
clear d
%
ind=1;
if nr <= 0 | nint <= 3  
   ind=0;
end 
if table(1,2) ~= 0 | table(nint,2) ~= 1 
   ind=0;
end
if ind==1
   r=rand(1,nr);
   for   ik=1:nr
      low=1;
      ihigh=nint;
      while ihigh-low > 1 
         mid = fix((ihigh+low)/2);
         if r(ik) <= table(mid,2); 
            ihigh = mid;
         end
         if r(ik) >= table(mid,2); 
            low = mid;
         end
      end
      d(ik) = table(low,1) ...
        +(table(ihigh,1)-table(low,1)) .* ...
         (r(ik)-table(low,2)) ./...
         (table(ihigh,2)-table(low,2)); 
   end
else
   pause
end
