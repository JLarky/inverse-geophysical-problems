% Script rnd0ald.m
% creation of the random values for different 
% discrete distributions
% list of distributions see below
% call function
% function d=rnd_ald(dtp,a,b,nr,p)
% d : vector with a batch of numbers
% dtp : type of distribution
% (a,b) : interval for creation of the distribution function
% nr : sample size
% p : vector of the  parameters of the distribution
%
% Please, choise the type of distribution (dtp) and calculate the 
% population (samples) for different distributions. If you have
% time, you can change the parameters of the distribution and
% compare the population with different parameters.
%(The notations of the parameters are the same as in the main 
% files for distribution functions.)
%
clear
%
b=100;
% sample size
%
nr=10000;
%
%%%%% to remove '%'
% dtp=1  %Binomial         disrtibution d=d_bin(n,x) 
% dtp=2  %Geometrical      disrtibution d=d_geom(n,x)
% dtp=3  %Hypergeometrical disrtibution d=d_hypg(n,n1,n2)  
% dtp=4  %Poisson          disrtibution d=d_poiss(n,x) 
dtp=1;
if dtp==1
%switch dtp
%   case 1      % Binomial 
      n=b;
      x=0.7;
      p(1)=x;
      raspr=['Binomial, n = ' num2str(n) ', p = ' num2str(x)];
end
if dtp==2
%   case 2      % Geometrical
      n=b;
      x=0.6;
      p(1)=x;
end
if dtp==3
%   case 3      % Hypergeometrical
      n=20;
      n1=20;
      n2=20;
      p(1)=n1;
      p(2)=n2;
end
if dtp==4
%   case 4      % Poisson
      n=b;
      x=50;
      p(1)=x;
      raspr=['Poisson, maxsize = ' num2str(n) ', a = ' num2str(x)];
end
%otherwise
%end
d=rnd_ald(dtp,n,nr,p);
h=figure(2);
plot(1:nr,d)
%stem(1:nr,d)
xmid=sum(d)/nr;
smid=sqrt(sum((d-xmid).^2)/(nr-1));
sample_math_exp=xmid
sample_stand_dev=smid
xlabel('Element number')
ylabel('Value')
title({['Random values (' raspr ', sample size = ' num2str(nr) ')'] ; ['math exp = ' num2str(sample_math_exp) ' stdev = ' num2str(sample_stand_dev)]})

set(gcf,'PaperUnits','centimeters');
xSize = 16; ySize = 8;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize]);
saveas(h,['randomd_' num2str(dtp) '_' num2str(nr) '.png']);