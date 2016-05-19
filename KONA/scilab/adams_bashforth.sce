function [x]=adams_bashforth(funct_name,x0,h,t0,tn)
	if min(size(x0))=1 then
		n=(tn-to)/h;
		m=max(size(x0));
		if size(x0,1)=1 then
			x0=x0';
		end
		x=zeros(m,n+1);
		x(1,:)=x0;
		fo=execstr(funct_name);
		for i=2:n+1
			fn=1
			x(i+1,:)=x(i,:)+(3*fn-fo)/(2*h);
			fo=fn;
		end
	end
endfunction
