function qdot=lowpass(q,t)
  R=100;
  C=.01;
  V=sin(100*t)+sin(t);
  qdot=V/R-q/(R*C);
endfunction
