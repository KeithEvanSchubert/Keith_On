n=5;
u=zeros(n,n);
for row=1:n
  for col = row:n
      u(row,col)=rand(1);
  end
end
xtrue=rand(n,1)
b=u*xtrue;

exec backward_substitution.sci;
x=backward_substitution(u,b)