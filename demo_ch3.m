%Demo for altitude-cognizant scalar Slepian functions

dom = [70,16];
Lmax = 10;
index = 5;
res = 0.5;
satrad = 6371+400;
planetrad = 6371;

[G,V] = glmalphapotup(dom,Lmax,satrad,planetrad);

%SH Coefficients
coef = potup(G,satrad,planetrad,Lmax,1);

%sorting the coefficients
lmcosi = coef2lmcosi(coef);

%Upward continue calculate derivative of scalar spherical harmonic
%Turn the coefficients of the magnetic potential field into the coefficients
%%of the magnetic field
coefalt = scalupderivative(coef,satrad,planetrad,Lmax);

%Plotting the magnetic field
figure
%sorting the coefficients
lmcosialt = coef2lmcosi(coefalt);

disp('Plotting...')
plotplm(lmcosialt,[],[],2,res)
title('Radial derivative Slepian function at satellite altitude')
kelicol(1)
colorbar

