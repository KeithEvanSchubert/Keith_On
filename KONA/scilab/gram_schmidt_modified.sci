function [Q,R]=gram_schmidt_modified(A)
  [rows,cols]=size(A);
  Q=A;
  R=zeros(cols,cols);
  for col=1:cols
    R(col,col)=norm(Q(:,col));
    Q(:,col)=Q(:,col)/R(col,col);
    for remaining_col = col+1:cols
      R(col,remaining_col)=Q(:,col)'*Q(:,remaining_col);
      Q(:,remaining_col)=Q(:,remaining_col)-R(col,remaining_col)*Q(:,col);
    end
  end
endfunction
