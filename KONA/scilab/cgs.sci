function [Q,R]=cgs(A)
  max_col=size(A,2);
  R=zeros(A);
  Q=A;
  R(1,1)=norm(A(:,1));
  Q(:,1)=Q(:,1)/R(1,1);
  for col=2:max_col
    for col2=1:col-1
      row=col2;
      R(row,col)=Q(:,col2)'*A(:,col);
      Q(:,col)=Q(:,col)-R(row,col)*Q(:,col2);
    end
    row=col;
    R(row,col)=norm( Q(:,col) );
    Q(:,col)=Q(:,col)/R(row,col);
  end
endfunction