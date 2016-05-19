function L=Cholesky(A)
n=size(A,2);
for col=1:n
  // work from diagonal out
  row=col;
  // square root of diagonal
  A(row,col)=sqrt(A(row,col));
  // scale rest of the row by the new diagonal
  for sub_row = row+1:n
    A(sub_row,col)=A(sub_row,col)/A(row,col);
  end
  // cleanup
  for sub_col=col+1:n
    // remove current column from remaining cols
    for sub_row=sub_col:n
      temp=A(sub_row,col)*A(sub_col,row);
      A(sub_row,sub_col)=A(sub_row,sub_col)-temp;
    end
    // zero the row above the diagonal
    A(row,sub_col)=0;
  end
end
L=A;
endfunction
