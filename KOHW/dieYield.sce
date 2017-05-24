c=5;
alpha=1:10;
yield=alpha;
for i=alpha
  yield(i)=(1+c/i)^(-i);
end

plot(alpha,yield)
