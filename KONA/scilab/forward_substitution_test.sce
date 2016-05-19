n=5;
l=zeros(n,n);
for row=1:n
  for col = 1:row
    l(row,col)=rand(1);
  end
end
xtrue=rand(n,1)
b=l*xtrue;

exec forward_substitution.sci;
x=forward_substitution(l,b)