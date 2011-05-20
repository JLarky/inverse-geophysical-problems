% Script rnd0alc.m
% creation of the random values for different continuous distributions
% list of distributions see below
% call function
% function d=rnd_alc(dtp,b,nint,nr,p)
% d : vector with a batch of numbers
% dtp : type of distribution
% b : interval for creation of the distribution function
% nint : number of samples for creation of 
%        the distribution function
% nr : sample size
% p : vector of the  parameters of the distribution
% !!! inside rnd_alc(dtp,b,nint,nr,p) exists one
%print operator (figure(1))
%
%
% Please, choise the type of distribution (dtp) and calculate the 
% population (samples) for different distributions. If you have
% time, you can change the parameters of the distribution and
% compare the population with different parameters.
%(The notations of the parameters are the same as in the main 
% files for distribution functions.)
clear
%******************** INPUT ********************
% a maximum value on x axis
% if x>0, that distribution function is defined at 0 < x < b
% else -b < x < b
%
b=20;
% number of samples for a tabulation of the distribution
% function at interval a < x < b, 
% where a is equal 0  or -b
%
nint=500; % number of samples for tabulation of the cumulative
%           distribution function
nr=1000; %sample size
dtp=2; %2,5,9,12
%
%%%%% to remove '%'
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
% dtp=12 % Uniform     distribution     d=d_inif(x,al,bt)

if dtp==4
%switch dtp
%   case 1      % Cauchy 
      a=-b;
end
if dtp==2
%   case 2      % Chi square
      a=0.0;
      n=30.0;
      p(1)=n;
      raspr=['Chi-square, n = ' num2str(n) ', sample size =' num2str(nr)]; 
end
if dtp==3
%   case 3      % Exponential
      a=0.0;
      l=1.0;
      p(1)=l;
end
if dtp==4
%   case 4      % Fisher
      a=-b;
      n1=50.0;
      n2=50.0;
      p(1)=n1;
      p(2)=n2;
end
if dtp==5
%   case 5      % Gaussian
      a=-b;
      xm=5.0; %expectation
      s=4.0;  % standard
      p(1)=xm;
      p(2)=s;
      raspr=['Gaussian, m = ' num2str(xm) ', stdev = ' num2str(s) ', sample size =' num2str(nr)]; 
end
if dtp==6
%   case 6      % Laplace
      a=-b;
      l=1.0;
      p(1)=l;
end
if dtp==7
%   case 7      % Logarithmic normal
      a=eps;
      xm=2.0;
      s=0.5;
      p(1)=xm;
      p(2)=s;
end
if dtp==8
%   case 8      %Snedecor
      a=eps;
      n1=20;
      n2=20;
      p(1)=n1;
      p(2)=n2;
end
if dtp==9
%   case 9      % Student
      a=-b;
      n=50;
      p(1)=n;
      raspr=['Student, n = ' num2str(n) ', sample size =' num2str(nr)]; 
end
if dtp==10
%   case 10     % Beta
      a=0;
      b=1;
      al=20;
      bt=20;
      p(1)=al;
      p(2)=bt;
end
if dtp==11
%   case 11      % Gamma
      a=0;
      al=20;
      bt=20;
      p(1)=al;
      p(2)=bt;
end
if dtp==12
%   case 12      % Unifform
      a=-b;
      al=2;
      bt=20;
      p(1)=al;
      p(2)=bt;
      raspr=['Uniform, a = ' num2str(al) ', b = ' num2str(bt) ', sample size =' num2str(nr)]; 
end
%otherwise
%end
%********************* END INPUT ***************
d=rnd_alc(dtp,b,nint,nr,p);
figure(2)
plot(1:nr,d)
%print -dps f0ralc2.ps
xmid=sum(d)/nr;
smid=sqrt(sum((d-xmid).^2)/(nr-1));
sample_math_exp=xmid
sample_stand_dev=smid
title({['Random values (' raspr ')'] ; ['mathexp = ' num2str(sample_math_exp) ', stdev = ' num2str(sample_stand_dev)]});
xlabel('Element');
ylabel('Value');
