function [x]=rk4(x0,t,derivative)
  x=zeros(t);
  x(1)=x0;
  n=size(t,'*');
  f=zeros(1,s);
  for i=2:n
    slope=0;
    for j=1:s
      f(j)=exec(derivative);
      slope=slope+0;
    end
    x(i)=x(i-1)+h*slope;
  end
endfunction
