function vectordemos(wht)
% A quick demo to show some of the vector Slepian things
%
% INPUT:
% 
% wht       select demo
%
% 1     Plot tangential vector Slepian functions for Australia
% 2     Plot tangential vector Slepian functions for random polar caps
% 3     Plot spectra of spatially truncated spectrally optimized Slepian
%       functions for North America
% 4     Plot internal-source gradient-vector Slepian function for Eurasia
%        
%
%
% Last modified by plattner-at-alumn.ethz.ch, 6/21/2015



switch wht
    case 1
        % Calculate tangential Slepian functions for Australia
        vectorslepian('demo1')
        disp('Vectorslepian has more demos and you can change the max degree and the region.')
        
    case 2
        % Calculate tangential Slepian function for a random polar cap,
        % random max degree and random index
        capvectorslepian('demo1')
        
    case 3
        % Plot 
        vectorspectral('demo1')
        disp('Vectorspectral has many more demos and you can change the max degree and the region.')
        warning('CHECK OUT THE OTHER vectorspectral.m DEMOS!!!!')
    
    case 4
        % Generate matrix of Slepian functions for Eurasia for a low max
        % degree
        % Choose maximum spherical-harmonic degree
        Lmax=10;
        [G,V]=gradvecglmalpha('eurasia',Lmax);
        % Now get the coefficients from the matrix
        
        % The resulting coefficients are coefficients for the "internal 
        % source gradient vector spherical harmonics" Elm that we describe
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
        
    otherwise error('Choose valid demo number')
        
end
