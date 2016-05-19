// demo of summation of sin terms in square wave
n=10;
m=256;

inc=2*%pi/m;

t=0:inc:2*%pi;
f=zeros(n,m+1);

f(1,:)=sin(t);
for i=2:10
  f(i,:)=f(i-1,:)+(sin(t*(2*i-1))/(2*i-1));
end

plot(t,f)
