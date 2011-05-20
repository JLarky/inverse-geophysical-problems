% script rnd0n2
% normally distributed random values (2-d)
% call function
%       d=rnd_n2(n,xm,s)
% xm : vector of mathematical expectation 
% s : variance matrix
% n : sample size
%
%
%
% Please, calculate the realization of the 2-dimensional Gaussian 
% distribution for different  values of the parameters:
%
% xm=[0.0 0.0];
% s=[9.0 0.0; 0.0 9.0];
%
% xm=[0.0 0.0];
% s=[25.0 0.0; 0.0 25.0];
%
% xm=[2.0 2.0];
% s=[9.0 0.0; 0.0 9.0];(correlation coefficient = 0)
%
% xm=[0.0 0.0];
% s=[16.0 8.; 8.0 16.0];(correlation coefficient = 0.5)
%
% xm=[0.0 0.0];
% s=[16.0 -8.; -8.0 16.0];(correlation coefficient = -0.5)
%
% xm=[0.0 0.0];
% s=[16.0 12.; 12.0 16.0]; (correlation coefficient = 0.75)
%
% xm=[0.0 0.0];
% s=[16.0 15.2; 15.2 16.0]; (correlation coefficient = 0.95)
%
%
% Please pay attention to the output at the 
% MATLAB COMMAND WINDOW.
%
%
clear
%******************** INPUT ********************
n=500;       % sample size
xm=[0 0];      % mathematical expectation
s=[1.0 0;0 1.0];       % variance matrix
%******************** END INPUT*****************
d=rnd_n2(n,xm,s);   % creation of sample d(1:2,1:n)
min0=min(min(d));
max0=max(max(d));
x=d(1,:);
y=d(2,:);
figure(2)
axis([min0 max0 min0 max0]);
axis square;
hold on
plot(x,y,'co' ,'MarkerEdgeColor','r');
%print -dps f0rndn21.ps
d=d';
sample_mat_exp=mean(d)
input_mat_exp=xm
sample_var_matrix=cov(d)
input_var_matrix=s
sample_cor_matrix=corrcoef(d)
input_cor_matrix=[s(1,1)/s(1,1) s(1,2)/sqrt(s(1,1)*s(2,2));...
s(2,1)/sqrt(s(2,2)*s(1,1)) s(2,2)/s(2,2)]

samplesizestr=['(sample size = ' num2str(n) ')']

inputmatexpstr=['input MATEXP = [ ' num2str(input_mat_exp) ' ]' ];
samplematexpstr=['sample MATEXP = [ ' num2str(sample_mat_exp) ' ]' ];

inputvarstr=['input VAR = [ ' num2str(input_var_matrix(1)) ' ' num2str(input_var_matrix(2)) ' ' num2str(input_var_matrix(3)) ' ' num2str(input_var_matrix(4)) ' ]'];
samplevarstr=['sample VAR = [ ' num2str(sample_var_matrix(1)) ' ' num2str(sample_var_matrix(2)) ' ' num2str(sample_var_matrix(3)) ' ' num2str(sample_var_matrix(4)) ' ]'];

inputcorstr=['input COR = [ ' num2str(input_cor_matrix(1)) ' ' num2str(input_cor_matrix(2)) ' ' num2str(input_cor_matrix(3)) ' ' num2str(input_cor_matrix(4)) ' ]'];
samplecorstr=['input COR = [ ' num2str(sample_cor_matrix(1)) ' ' num2str(sample_cor_matrix(2)) ' ' num2str(sample_cor_matrix(3)) ' ' num2str(sample_cor_matrix(4)) ' ]'];

title({['Sample from 2-D Gaussian distribution' samplesizestr] ; [inputmatexpstr '; ' samplematexpstr] ; [inputvarstr '; ' samplevarstr] ; [inputcorstr '; ' samplecorstr] })
