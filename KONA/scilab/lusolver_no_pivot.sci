function [u,linvb]=lusoler_no_pivot(A,b)
[m,n]=size(A);
l=eye(m,m);
u=A;
linvb=b
for colPivot=1:n
  // pivot is on main diagonal (row=col)
  rowPivot=colPivot;
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
    update=l(row,colPivot)*linvb(rowPivot);
    linvb(row)=linvb(row)-update;
  end
end
endfunction