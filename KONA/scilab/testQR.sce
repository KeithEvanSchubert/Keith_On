xtrue=[ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 1 1 1 1 0 0 0 0 0 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 1 1 1 2 2 2 2 2 2 2 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 1 1 1 2 9 2 9 2 9 2 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 2 9 9 9 2 9 2 0 0 0 5 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 2 9 2 9 2 9 2 0 0 0 5 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 2 2 2 2 2 2 2 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0 5 5 5 5 0 0 0 0];
[rows,cols]=size(xtrue);
A=zeros(rows,rows);
sigma_sq=10;
for r=1:rows
  for c=1:rows
    A(r,c)=exp(-(r-c)^2/sigma_sq);
  end
end
b=A*xtrue+rand(rows,cols,"normal").*0.00001;
[Qc,Rc]=cgs(A);
[Qm,Rm]=mgs(A);
[Qh,Rh]=hhqr(A);

xc=Rc\Qc'*b;
xm=Rm\Qm'*b;
xh=Rh\Qh'*b;
subplot(2,2,1);
Matplot(round(xtrue))
xtitle("True");
subplot(2,2,2);
Matplot(round(xc))
xtitle("Classical");
subplot(2,2,3);
Matplot(round(xm))
xtitle("Modified");
subplot(2,2,4);
Matplot(round(xh))
xtitle("Householder");
