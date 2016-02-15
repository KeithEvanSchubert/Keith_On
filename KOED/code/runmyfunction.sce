exec("quadratic.sci");
x=-5:.01:5;
y=quadratic(x,1,0,-1);
plot(x,y,'r-')
plot([min(x);max(x)],[0;0],'k-')
plot([0;0],[min(y)-4;max(y)+1],'k-')
