exec("C:/Documents and Settings/laptop/My Documents/Keith On/KOL/compounding.sci")
n=[1:9 10:10:90 100:100:1000];
apy=zeros(n);
for i=1:max(size(n))
  apy(i)=compounding(1,n(i));
  disp([n(i) apy(i)])
end
disp([%inf %e])
limit=ones(n).*%e;
plot(n,apy,n,limit)
xtitle("Continuous Compounding Graph","[n] Number of Compoundings","[1+APY] Multiplier of Principle")
