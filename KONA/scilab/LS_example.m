Y=[1;2;3];
Ye=log([1;.5;.25]);
Yee=log([1;.5;.25]+.3*rand(3,1));
X=[0;1;2];
One=ones(3,1);
Phi=[One,X];

A=Phi\Y
norm(Y-Phi*A)

Ae=X\Ye
Aee=X\Yee

Xf=0:.05:2;

Yfe=exp(Ae.*Xf);
Yfee=exp(Aee.*Xf);

p1=[-.1,2.1];
p2=[-.1,3.1];
q=[0,0];

subplot(3,1,1)
plot(X,Y,'w*',X,Phi*A,'w-',p1,q,'w-',q,p2,'w-')
axis([p1,p2])
subplot(3,1,2)
plot(X,exp(Ye),'w*',Xf,Yfe,'w-',p1,q,'w-',q,p2,'w-')
axis([p1,p2])
subplot(3,1,3)
plot(X,exp(Yee),'w*',Xf,Yfee,'w-',p1,q,'w-',q,p2,'w-')
axis([p1,p2])