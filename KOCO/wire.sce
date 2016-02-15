rho=1.72e-8;
r=[101.9 80.8 64.1]/2;
amp=[33 23 17];

for i=1:3
  therm(i)=amp(i)^2*rho/(2*%pi^2*r(i)^3)
end

plot(1:3,therm)