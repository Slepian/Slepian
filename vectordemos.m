function vectordemos(wht)
% Demo to show some of the capabilities of the software. Many of the 
% m-files have demos themselves usually through filename('demo1') 
%
% INPUT:
% 
% wht       select demo
%
% 1     Plot tangential vector Slepian functions for Australia
% 2     Plot tangential vector Slepian functions for random polar caps
% 3     Plot spectra of spatially truncated spectrally optimized Slepian
%       functions for North America
% 4     Calculate and plot the eigenvalue weighted sum of all vector 
%       Slepian functions for the combined continents.
%       WARNING: In Octave this will only work once polybool is in the
%       mapping package which should happen somewhen in 2016. Please keep
%       your packages updated by running "pkg update" regularly 
% 5     For different spherical cap sizes: Eigenvalues of the Slepian
%       functions for different orders m.
% 6     Construct and plot purely internal-field E_lm Slepian function 
%       for Eurasia
% 7     Construct and plot purely external-field F_lm Slepian function 
%       for Eurasia
% 8     Construct internal- and external-field Slepian function 
%       for Eurasia 
% 9     Toroidal vector Slepian function
% 10    Write a Slepian function out to a GMT file (shows GMT instructions) 
%
% Last modified by plattner-at-alumn.ethz.ch, 6/28/2016



switch wht
    case 1
        % Calculate tangential Slepian functions for Australia
        vectorslepian('demo1')
        disp('Vectorslepian has more demos and you can change the max degree and the region.')
        warning('CHECK OUT THE OTHER vectorspectral.m DEMOS!!!!')
        
    case 2
        % Calculate tangential Slepian function for a random polar cap,
        % random max degree and random index
        capvectorslepian('demo1')
        
    case 3
        % Plot 
        vectorspectral('demo1')
        disp('Vectorspectral has many more demos and you can change the max degree and the region.')
        
    
    case 4
        % Calculate and plot the eigenvalue-weighted sum of the vector
        % Slepian functions for all continents combined.
        Lmax=5;
        psallcons([],Lmax,1);
        psconsum(Lmax)
        
        disp('Choose a higher degree to have better spatial concentration')
        disp('Now watch PSMOVE.avi')
        
    case 5
        % Show eigenvalues
        psvals(1)
                        
        
    case 6
        % Generate matrix of Slepian functions for Eurasia for a low max
        % degree
        % Choose maximum spherical-harmonic degree
        Lmax=10;
        [G,V]=gradvecglmalpha('eurasia',Lmax);
        % Now get the coefficients from the matrix
        
        % The resulting coefficients are the coefficients for the 
        % "internal-fied spherical harmonics" Elm to evaluate the 
        % internal-field Slepian functions that we describe
        % in our article "Potential field estimation using scalar and 
        % vector Slepian functions at satellite altitude", 
        % doi: 10.1007/978-3-642-27793-1_64-2
        % Choose which one to show (best=1, second-best=2, etc.)
        whichone=1;
        coef=G(:,whichone);
        % Now transform the coefficient into lmcosi.         
        % The coefficient vector is currently in ADDMOUT ordering format 
        % because that's what gradvecglmalpha is returning. We therefore
        % need to set the flag 1 in coef2lmcosi        
        elmcosi=coef2lmcosi(coef,1);
        % Next we evaluate the radial, colatitudinal, and longitudinal
        % components of the Slepian function on a regular grid.
        % We use the function elm2xyz to evaluate the elm coefficients on a
        % 1 degree by 1 degree grid.
        [r,lon,lat]=elm2xyz(elmcosi,1);
        % And now plot it
        % plotplm needs radians, lon, lat is in degrees 
        plotplm(r{1},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Radial component')
        
        figure
        plotplm(r{2},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Colatitudinal component')
        
        figure
        plotplm(r{3},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Longitudinal component')
        
    case 7
        % Generate matrix of external Slepian functions for Eurasia for a 
        % low max degree
        % Choose maximum spherical-harmonic degree
        Lmax=10;
        [G,V]=outgradvecglmalpha('eurasia',Lmax);
        % Now get the coefficients from the matrix
        
        % The resulting coefficients are the coefficients for the 
        % "internal-fied spherical harmonics" Elm to evaluate the 
        % internal-field Slepian functions that we describe
        % in our article "Potential field estimation using scalar and 
        % vector Slepian functions at satellite altitude", 
        % doi: 10.1007/978-3-642-27793-1_64-2
        % Choose which one to show (best=1, second-best=2, etc.)
        whichone=1;
        fcoef=G(:,whichone);
        % Now transform the coefficient into lmcosi.         
        % The coefficient vector is currently in ADDMOUT ordering format 
        % because that's what outgradvecglmalpha is returning. We therefore
        % need to set the flag 1 in fcoef2flmcosi        
        flmcosi=fcoef2flmcosi(fcoef,1);
        % Next we evaluate the radial, colatitudinal, and longitudinal
        % components of the Slepian function on a regular grid.
        % We use the function flm2xyz to evaluate the elm coefficients on a
        % 1 degree by 1 degree grid.
        [r,lon,lat]=flm2xyz(flmcosi,1);
        % And now plot it
        % plotplm needs radians, lon, lat is in degrees 
        plotplm(r{1},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Radial component')
        
        figure
        plotplm(r{2},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Colatitudinal component')
        
        figure
        plotplm(r{3},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Longitudinal component')
        
        
    case 8
        % Generate matrix of internal and external Slepian functions  
        % for Eurasia for a low max degree
        % Choose maximum spherical-harmonic degree for internal field
        Lint=15;
        % and for external field
        Lext=5;
        [G,V]=inoutgradvecglmalpha('eurasia',Lint,Lext);
        % Now get the coefficients from the matrix
        
        % The resulting coefficients are the coefficients for the 
        % "internal-fied spherical harmonics" Elm to evaluate the 
        % internal-field Slepian functions that we describe
        % in our article "Potential field estimation using scalar and 
        % vector Slepian functions at satellite altitude", 
        % doi: 10.1007/978-3-642-27793-1_64-2
        % Choose which one to show (best=1, second-best=2, etc.)
        whichone=1;
        coef=G(:,whichone);
        % The internal-field component is up to degree Lint and the 
        % external field is up to degree Lext. Because there is no L=0 for 
        % external fields, there are only (Lext+1)^2-1 coefficients for the
        % external field but there are (Lint+1)^2 coefficients for the
        % internal field.
        % The coef vector that we obtained is ordered such that the first
        % (Lint+1)^2 values are coefficients for the internal field and the
        % last (Lext+1)^2-1 values are coefficients for the external field:
        coefint=coef(1:(Lint+1)^2);
        coefext=coef((Lint+1)^2+1:end);
        % Now transform the coefficient into lmcosi.         
        % The coefficient vector is currently in ADDMOUT ordering format 
        % because that's what gradvecglmalpha is returning. We therefore
        % need to set the flag 1 in coef2lmcosi and fcoef2flmcosi 
        elmcosi=coef2lmcosi(coefint,1);
        flmcosi=fcoef2flmcosi(coefext,1);
        % Next we evaluate the radial, colatitudinal, and longitudinal
        % components of the Slepian function on a regular grid.
        % We use the function elm2xyz to evaluate the elm coefficients on a
        % 1 degree by 1 degree grid.
        [rint,lon,lat]=elm2xyz(elmcosi,1);
        [rext,lon,lat]=flm2xyz(flmcosi,1);
        % And now plot it
        % plotplm needs radians, lon, lat is in degrees 
        subplot(1,2,1)
        plotplm(rint{1},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Radial component internal field')
        
        subplot(1,2,2)
        plotplm(rext{1},lon*pi/180,lat*pi/180,2);
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Radial component external field')
        
    case 9
        % Purely toroidal Vector Slepian function
        Lmax=10;
        [G,V]=torvecglmalpha('namerica',Lmax);
        whichone=1;
        coef=G(:,whichone);
        % Toroidal functions do not have degree 0, so they are treated the
        % same way as F_lm coefficients:
        clmcosi=fcoef2flmcosi(coef,1);                
        % We don't have a special function clm2xyz, but we do have 
        % blmclm2xyz. So just feed it an empty blmcosi. 
        % It needs to be up to the same max spherical harmonic degree as 
        % the clm
        % For this we use the handy function addmon which can create a zero
        % lmcosi
        [~,~,~,blmcosi]=addmon(Lmax);
        % And evaluate the zero-blmcosi and the clmcosi
        % One small step is still needed: addmon creates an lmcosi that
        % goes from L=0 to L=Lmax, but blmcosi can not have an L=0
        % component, otherwise there is adivision by 0. So we remove the
        % L=0:
        blmcosi=blmcosi(2:end,:);
        % Then evaluate the field
        [rtor,lon,lat]=blmclm2xyz(blmcosi,clmcosi,1);
        % And plot it
        
        % Longitudinal is the (:,:,1) part (see help blmclm2xyz) 
        plotplm(rtor(:,:,1),lon*pi/180,lat*pi/180,2);
        view(20,40)
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Longitudinal component toroidal Slepian function')
        
        % Colatitudinal is the (:,:,2) part (see help blmclm2xyz) 
        figure
        plotplm(rtor(:,:,2),lon*pi/180,lat*pi/180,2);
        view(20,40)
        kelicol(1)
        colorbar
        caxis([-1 1]*max(abs(caxis)))
        title('Colatitudinal component toroidal Slepian function')
        
    case 10
        % Generate matrix of Slepian functions for Eurasia for a low max
        % degree
        % Choose maximum spherical-harmonic degree
        Lmax=20;
        [G,V]=gradvecglmalpha('eurasia',Lmax);
        
        % We want to plot the 5th best
        index=5;
        coef=G(:,index);
        % Remember, any glmalpha function (including gradvecglmalpha)
        % returns the coefficients ordered in ADDMOUT, so we need to set 
        onorout=1;
        lmcosi=coef2lmcosi(coef,onorout);       
        % Now evaluate the function
        % Let's set resolution to 0.5 degrees per pixels
        res=0.5;
        [datB,lon,lat]=elm2xyz(lmcosi,res);        
        
        % Let's use the radial component:
        cmp=1;
        % Let's write it to
        filename='Eurasia_radial.nc';
        % grdwrite2p needs some flipping to understand our ordering scheme:
        grdwrite2p(lon,flipud(lat),flipud(datB{cmp}),filename);
        
        disp('Plot the resulting fields using GMT (http://gmt.soest.hawaii.edu/)')
        disp('For GMT 5, simply run the following three calls to plot the grd file in a Mollweide projection')        
        disp(' ')
        disp('gmt grd2cpt Eurasia_radial.nc -Cpolar -E100 -T= > colorscale.cpt')
        disp('gmt grdimage Eurasia_radial.nc -Rg -JW0/20c -K -Ccolorscale.cpt > Eurasia_radial.ps')
        disp('gmt pscoast -Rg -JW -W -O -K >> Eurasia_radial.ps')
        disp(' ')
        
    otherwise error('Choose valid demo number')
        
end
