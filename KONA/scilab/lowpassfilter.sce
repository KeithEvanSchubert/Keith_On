t=0:.01:12;
vin=sin(100*t)+sin(t);
q0=0;
q=zeros(t);
q(1)=q0;
h=.1;
a=1;
b=1/(2*a);

for i=2:max(size(t))
  qdot_pt1=lowpass(q(i-1),t(i));
  qdot_pt2=lowpass(q(i-1)+a*h*lowpass(q(i-1),t(i)),t(i)+a*h);
  q(i)=q(i-1)+h*(1-b)*qdot_pt1+b*h*qdot_pt2;
end

C=.01;
Vout=q/C;

plot(t,[vin],'-b',t,[Vout],'-g')
legend('Vin','Vout')
