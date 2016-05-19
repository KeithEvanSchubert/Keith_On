function [Q,R]=gram_schmidt_classic(A)
  [rows,cols]=size(A);
  Q=A;
  R=zeros(cols,cols);
  for col=1:cols
    for orthogonal_dir = 1:col-1
      R(orthogonal_dir,col)=Q(:,orthogonal_dir)'*A(:,col);
      Q(:,col)=Q(:,col)-R(orthogonal_dir,col)*Q(:,orthogonal_dir);
    end
    R(col,col)=norm(Q(:,col));
    Q(:,col)=Q(:,col)/R(col,col);
  end
endfunction
