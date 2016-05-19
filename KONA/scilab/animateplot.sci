function []=animateplot(t,x,y,plotstring)
  // needed to size window
  largest_y=max(y);
  smallest_y=min(y);
  largest_x=max(x);
  smallest_x=min(x);
  xselect();                // create graph window
  f=get("current_figure");
  f.pixmap="on";       // buffer for animation
  plot2d(0,0,rect=[smallest_x,smallest_y,largest_x,largest_y]);
  a=get("current_axes");
  a.auto_scale="off";
  t_step=(t(2)-t(1))/10;
  realtimeinit(t_step)      // set time interval
  realtime(t(1)-t_step)                 // it is now t=0
  for i=1:size(t,'*')
    realtime(t(i))             // wait till it is t=t(i)
    xbasc;           // clear plot
    plot(x(:,i),y(:,i),plotstring);
    a.data_bounds=[smallest_x,smallest_y,largest_x,largest_y];
    show_pixmap();          // show plot
  end
endfunction
