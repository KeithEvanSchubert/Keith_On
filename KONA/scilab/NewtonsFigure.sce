x=(0:.01:3)';
y1=x.^2;
y2=4.*x-4;
y3=2.*x-1;
y4=x-.25;
set("figure_style","new") //create a figure
a=get("current_axes"); 
a.data_bounds=[0,0,2.5,6];
a.auto_scale="off"
plot2d(x,[y1])
xtitle("Newton''s Method",'x','y')
//xgrid(9)
xline=[.25 .5  .5 1 1 2 2];
yline=[0   .25 0  1 0 4 0];
xpoly(xline,yline)
