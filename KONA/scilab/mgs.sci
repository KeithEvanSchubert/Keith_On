function [Q,R]=mgs(A)
  max_col=size(A,2);
  R=zeros(A);
  Q=A;
  for col=1:max_col
    row=col;
    R(row,col)=norm( Q(:,col) );
    Q(:,col)=Q(:,col)/R(row,col);
    for col2=col+1:max_col
      R(row,col2)=Q(:,col)'*Q(:,col2);
      Q(:,col2)=Q(:,col2)-R(row,col2)*Q(:,col);
    end
  end
endfunction