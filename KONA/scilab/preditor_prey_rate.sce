function [xdot]=preditor_prey_rate(starve,birth,eat,eaten,preditor,prey)
	xdot=zeros(2,1);
	xdot(1)=(eat*prey-starve)*preditor;
	xdot(2)=(birth-eaten*preditor)*prey;
endfunction
