A=[0,0,0,0,5,-7,6,4];
B=[0,0,0,0,0,2,-1,3];
C=convol(A,B);
//Afft=fft(A)
//Bfft=fft(B)
//C2=ifft(A.*B)
x=exp(%i*%pi/4);
X= [1,x,x^2,x^3,x^4,x^5,x^6,x^7];
X2=X.*X;
AX=(-7.*X2+4)+X.*(5.*X2+6);
BX=2.*X2-X+3;
CX=AX.*BX;
X4=X2.*X2;
D=CX(1)+CX(2).*X+X2.*(CX(3)+CX(4).*X)+X4.*(CX(5)+CX(6).*X+X2.*(CX(7)+CX(8).*X));
C2=D./8

