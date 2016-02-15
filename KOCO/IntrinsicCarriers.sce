//Setup
GaAs=1;
Ge=2;
Si=3;
Eg = [1.42
      0.66
      1.12];//eV
B = [2.1E14
     1.66E15
     5.23E15];//cm^{-3}K^{-3/2}
k=86E-6;//eV/K

//user selections
T=300;//Kelvin
material = Ge;

ni = B(material) * T^1.5 * exp(-Eg(material) / (2*k*T)) // in cm^{-3}