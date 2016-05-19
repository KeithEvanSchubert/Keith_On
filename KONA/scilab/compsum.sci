function Sum=compsum(x)
  [row,col]=size(x);
  n=max(row,col);
  Sum=0;
  carry=0;
  for i=1:row
    for j=1:col
      x_corrected = x(i,j)-carry;
      next_sum = Sum + x_corrected;
      carry = (next_sum - Sum) - x_corrected;
      Sum=next_sum;
    end
  end
endfunction
