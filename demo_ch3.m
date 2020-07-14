%Demo for altitude-cognizant scalar Slepian functions

dom = 'africa'; %[70,16];
Lmax = 10;
res = 0.5;
satrad = 6371+400;
planetrad = 6371;

[G,V] = glmalphapotup(dom,Lmax,satrad,planetrad);

%SH Coefficients
coef = potup(G(:,1),satrad,planetrad,Lmax,1);

%sorting the coefficients
lmcosi = coef2lmcosi(coef,1);

data = plm2xyz(lmcosi,res);

%Plotting
figure

disp('Plotting...')
plotplm(xyz,[],[],2,res)
title('Slepian function at satellite altitude')
kelicol(1)
colorbar
