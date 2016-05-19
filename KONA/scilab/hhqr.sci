function [Q,R]=hhqr(A);
  [max_row,max_col]=size(A);
  R=A;
  Q=eye(max_row,max_row);
  for col=1:max_col
    row=col;
    v=R(row:max_row , col);
    r=norm(v);
    v(1)=v(1)+sign(v(1))*r;
    v=v/norm(v);
    R(row,col)=-sign(R(row,col))*r;
    R(row+1:max_row,col)=zeros(max_row-row,1);
    for col2= col+1:max_col
      R(row:max_row,col2) = R(row:max_row,col2)-v.*(2*v'*R(row:max_row,col2));
    end
    max_col_q=max_row;
    Q(:,col:max_col_q)=Q(:,col:max_col_q)-2.*Q(:,col:max_col_q)*v*v';
  end
endfunction