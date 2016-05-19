function x=forward_substitution(l,b)
n=size(l,2); // n is number of columns in l
x=zeros(n,1);

for col = 1:n
  row = col; // consider main diagonal
  if l(row,col)==0 then // lower triangular matrix is
      break;           //singular if zero on diagonal
  end
  x(col)=b(row)/l(row,col); // calculate next component of x
  for row=col+1:n  // remove effect from subsequent rows
    b(row) = b(row) - l(row,col)*x(col);
  end
end
endfunction