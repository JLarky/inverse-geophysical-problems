function d=rnd_n2(n,xm,s)
%Gaussian disrtibution (2-d) d=rnd_n2(nx,xm,s)
% xm : vector of mathematical expectation 
% s : variance matrix
% n : sample size
% d(1,:) : the first sample (x-coordinate)
% d(2,:) : the second sample (y-ccordinate) 
%*******************************
s11=sqrt(s(1,1));
s21=s(1,2)/s11;
s22=sqrt(s(2,2)-(s(2,1) .^2 ./s(1,1)));
ss=[s11 0;s21 s22];
x=randn(2,n);
xm=xm';
d=zeros(2,n);
for ik=1:n
   x2=[x(1,ik) x(2,ik)];
   x2=x2';
   d2=ss*x2 + xm;
   d(1,ik)=d2(1,1);
   d(2,ik)=d2(2,1);
end



