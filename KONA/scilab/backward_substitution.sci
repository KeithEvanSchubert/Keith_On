function x=backward_substitution(u,b)
n=size(u,2); // n is number of columns
x=zeros(n,1); // predefine size makes the code faster,
              // because no memory allocation calls
for col = n:-1:1  // bottom up for backward
  row = col; // consider main diagonal
  if u(row,col)==0 then // lower triangular matrix is
      break;           //singular if zero on diagonal
  end
  x(col)=b(row)/u(row,col); // calculate next component of x
  for row=1:col-1  // remove effect from subsequent rows
    b(row) = b(row) - u(row,col)*x(col);
  end
end
endfunction
