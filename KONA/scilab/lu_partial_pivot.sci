function [p,l,u]=lu_partial_pivot(A)
[m,n]=size(A);
l=eye(m,m);
p=l;
u=A;
for colPivot=1:n
  // find the largest element in column
  // start with main diagonal
  rowPivot=colPivot;
  colmax=abs(u(rowPivot,colPivot));
  for row=colPivot+1:n
    if abs(u(row,colPivot))>colmax then
      rowPivot=row;
      colmax=abs(u(rowPivot,colPivot));
    end
  end
  if rowPivot>colPivot then
    for col=1:n
      temp=u(colPivot,col);
      u(colPivot,col)=u(rowPivot,col);
      u(rowPivot,col)=temp;
      temp=p(colPivot,col);
      p(colPivot,col)=p(rowPivot,col);
      p(rowPivot,col)=temp;
    end
    for col=1
    rowPivot=colPivot;
  end 
  // make sure the pivot isn't zero, as 
  // we must divide by it
  if u(rowPivot,colPivot)==0 then
    break;
  end
  // calculate the next col of l
  for row=rowPivot+1:n
    l(row,colPivot)=u(row,colPivot)/u(rowPivot,colPivot);
  end
  // update u
  for row=rowPivot+1:n
    u(row,colPivot)=0;
    for col=colPivot+1:n
      update=l(row,colPivot)*u(rowPivot,col)
      u(row,col)=u(row,col)-update;
    end
  end
end
endfunction