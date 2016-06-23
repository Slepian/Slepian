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
% 4     Plot internal-field E_lm Slepian function for Eurasia
% 5     Calculate and plot the eigenvalue weighted sum of all vector 
%       Slepian functions for the combined continents.
%       WARNING: In Octave this will only work once polybool is in the
%       mapping package which should happen somewhen in 2016. Please keep
%       your packages updated by running "pkg update" regularly 
% 6     For different spherical cap sizes: Eigenvalues of the Slepian
%       functions for different orders m.
%        
%
%
% Last modified by plattner-at-alumn.ethz.ch, 6/23/2015



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
        
    case 5
        % Calculate and plot the eigenvalue-weighted sum of the vector
        % Slepian functions for all continents combined.
        Lmax=5;
        psallcons([],Lmax,1);
        psconsum(Lmax)
        
        disp('Choose a higher degree to have better spatial concentration')
        disp('Now watch PSMOVE.avi')
        
    case 6
        % Show eigenvalues
        psvals(1)
        
    otherwise error('Choose valid demo number')
        
end
