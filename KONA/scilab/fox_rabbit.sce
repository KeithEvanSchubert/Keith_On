function [xdot]=fox_rabbit(t,x)
	starve=5;
	birth=10;
	eat=.01;
	eaten=.5;
	preditor=x(1);
	prey=x(2);
	getf('preditor_prey_rate.sce');
	xdot=preditor_prey_rate(starve,birth,eat,eaten,preditor,prey);
endfunction
