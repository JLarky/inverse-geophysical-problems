function d=d_unif(x,a,b)
%Uniform  disrtibution d=d_unif(x,a,b)
% x : if x > b or x < a then d=0 
% a : 
% b : 
%        b > a
%*******************************
d=zeros(1,length(x));
f=1 ./ (b-a);
for ik=1:length(x)
   if x(ik) < a | x(ik) > b
      d(ik)=0;
   else
      d(ik)=f;
   end
end 

