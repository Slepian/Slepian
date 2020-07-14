function demos_slepian_hotel(wht)
% demos_slepian_hotel(wht)
%
% The Slepian functions are constructed to optimally solve -grad(V) = d
% for the scalar potential V, where d is either the measured radial
% component of the field or all three components.
%
% INPUT:
%
% wht   Choose your example:
%       1 Generate and plot internal-field altitude vector Slepian functions 
%         for radial data only
%       2 Generate and plot altitude vector Slepian functions for vectorial
%         data
%       3 Generate random model, then random radial derivative internal-field  
%         data, then invert data 
%       4 Generate random model, then random gradient internal-field 
%         data (all components), then invert data 
%       5 Generate random internal and external model, then evaluate it at
%         randomly distributed points and invert for both the internal and
%         external field
%       6 Write vector field for internal and external Slepian function to a
%         grd file that can be read by GMT
%
%    
% Last modified by plattner-at-alumni.ethz.ch, 05/26/2017

switch wht
    case 1
        % Region:
        % Do you want a spherical cap or ring?
        %dom=[30.5 7.3];
        %clon=18;
        %ccola=90+33;        
        
        % Or a region
        dom='africa';
        clon=[]; ccola=[];

        
        % Maximum spherical harmonic degree:
        Lmax=20;
        
        % Which one of the Slepian functions:
        index=5;
        
        % Plotting resolution (degrees per pixel):
        res=0.5;
        
        % The altitude where the data is:
        satrad=6371+400;
        
        % The radius of the Planet, OR the sphere for which you want to
        % optimally find the coefficients is: 
        planetrad=6371;
        
        % Now obtain the Slepian function coefficients:
        % If you want a rotated spherical cap or ring:
        if clon~=0 | ccola~=0 
            [G,V]=glmalphauptoJp(dom,Lmax,satrad,planetrad,clon,ccola,[],index);
        else % Or if you want a polar cap or named region
            [G,V]=glmalphaup(dom,Lmax,satrad,planetrad);
        end
        
        % This is a little script inside "examples.m" that reads out the
        % right column of G. It's simple but takes a few lines. Check out
        % further down.
		coef=getcoefs(index,G,V,dom,Lmax);      
        
        % And now plot: 
        
        % First the potential field Slepian functions on the planet's
        % surface:
        % Transform the Slepian coefficients into lmcosi        
        lmcosi=coef2lmcosi(coef);
        
        % To plot a linear combination of spherical harmonics saved as
        % lmcosi, use plotplm
        clf;
        plotplm(lmcosi,[],[],2,res)
        title('Potential Slepian function on planet surface')
        kelicol(1)
        colorbar
        
        % Then the negative radial derivative Slepian function at satellite 
        % altitude
        coefalt=scalupderivative(coef,satrad,planetrad,Lmax);
        % Note: You can reevaluate the radial derivative at any altitude by
        % simply changing satrad
        figure
        lmcosialt=coef2lmcosi(coefalt);
        plotplm(lmcosialt,[],[],2,res)
        title('Radial derivative Slepian function at satellite altitude')
        kelicol(1)
        colorbar
        
        
    case 2
        % This is almost entirely the same as example 1, except that we use
        % gradvecglmalphaup and then plot all three vectorial components
        
        % Component 1 is radial outward
        % Component 2 is colatitudinal southward
        % Component 3 is longitudinal eastward
        
        % Do you want spherical cap or ring?
        dom=[17.24 10.55]; 
        clon=18;
        ccola=90+33;        
        
        % Or a region:
        %dom='africa';
        %clon=[]; ccola=[];
        
        % Maximum spherical harmonic degree:
        Lmax=20;
        
        % Which one of the Slepian functions:
        index=5;
        
        % Plotting resolution (degrees per pixel):
        res=0.5;
        
        % The altitude where the data is:
        satrad=6371+400;
        
        % The radius of the Planet, OR the sphere for which you want to
        % optimally find the coefficients is: 
        planetrad=6371;
        
        % Now obtain the Slepian function coefficients:
        % If you want a rotated spherical cap or ring:
        if clon~=0 || ccola~=0 
            [G,V]=gradvecglmalphauptoJp(dom,Lmax,satrad,planetrad,clon,ccola,[],index);
        else % Either polar cap/ring or named region
            [G,V]=gradvecglmalphaup(dom,Lmax,satrad,planetrad);
        end
            
        % This is a little script inside "examples.m" that reads out the
        % right column of G. It's simple but takes a few lines. Check out
        % further down.
        coef=getcoefs(index,G,V,dom,Lmax);         
        
        % And now plot: 
        % First the potential field Slepian functions on the planet's
        % surface:
        % Transform the Slepian coefficients into lmcosi      
        lmcosi=coef2lmcosi(coef);
        plotplm(lmcosi,[],[],2,res)
        title('Potential Slepian function on planet surface')
        kelicol(1)
        colorbar
        
        % Then the negative radial derivative Slepian function at satellite 
        % altitude
        coefalt=vecupderivative(coef,satrad,planetrad,Lmax);        
        % Note: You can reevaluate the radial derivative at any altitude by
        % simply changing satrad
        figure        
        elmcosialt=coef2lmcosi(coefalt);
        % I don't have a direct plotting routine for linear combinations of
        % the Elm. Therefore we need to evaluate them
        [data,lon,lat]=elm2xyz(elmcosialt,res);
        
        for component=1:3           
            subplot(3,1,component)
            plotplm(data{component},lon*pi/180,lat*pi/180,2,res)
            title(sprintf('Vector gradient component %d at sat alt',component))
            kelicol(1)
            colorbar
        end                              
        
        
    case 3        
        % Region
        dom=[20.2 9.39];   
        rotcoords=[50 40];
        %dom='africa';
        %rotcoords=[];
        
        % Maximum spherical harmonic degree:
        Lmax=20;
        
        % How many Slepian functions for inversion
        % Here I just huess something random. One of the key difficulties
        % is getting good values for J!!!!
        %J=60; % for Africa example
        J=60; % For belt/rotcoords example 
        
        % The radius of the Planet, OR the sphere for which you want to
        % optimally find the coefficients is: 
        planetrad=6371;
        
        % The AVERAGE data altitude for which to construct the altitude 
        % Slepian functions:
        satrad=6371+400;
        % By how much would you like to vary the satellite altitude:
        varalt=100;
        
        % Seeding numer or random data points. WARNING: The actual number
        % of random points will be smaller!!!! Much smaller for irregular
        % regions or annuli with large inner opening angle.
        N=2000;  
        
        % Do you want to add random noise? If no, set this to 0. Otherwise
        % choose a value (see further down how it is used)
        noiselevel=0;
                
        % Plotting resolution (degrees per pixel):
        res=0.5;               
        
        % Make random model spherical harmonic coefficients or load them or
        % simply write them down, or make random field following a power
        % law. Here we just put in random for testing.
        % This is one of Frederik's random field generator functions
        rnd_lmcosi=plm2rnd(Lmax,0);
        % Transform this into ADDMON coefficient vector
        coef=lmcosi2coef(rnd_lmcosi);
        
        % This little script is located further down in "examples.m" It
        % generates equal-area-randomly located points within the target
        % region dom. The number of generated points will always be lower
        % than N!!!
        % It then for each point generates a random satellite altitude that
        % has a uniformly random distribution in 
        % [satrad-varalt/2 satrad+varalt/2]        
        [rad,theta,phi]=makerandpoints(dom,N,satrad,varalt,rotcoords);
        
        % Evaluate the Slepian functions given by coef. We have an
        % efficient function for that       
        data=rGscal(coef,theta,phi,rad,planetrad)';
                
        
        % If you want you can now add noise to your data:        
        data=data + noiselevel*mean(abs(data))*rand(size(data)); 
        
        %%%%%% HERE IS THE DATA INVERSION %%%%%%%%       
        
        % Now invert randomly generated data       
        
        result_coef=LocalIntField(data,rad,theta,phi,dom,Lmax,J,planetrad,satrad,rotcoords);
                
        % Remark: You have to give "LocalIntField" your chosen average
        % satellite radius "satrad" because otherwise it just takes the
        % average and calculates new Slepian functions from it.
        % also: "LocalIntField" has more input if you want to save 
        % evaluated Slepian functions or give it preevaluated spherical
        % harmonics. This help a lot in reducing calculation costs if you
        % want to calculate solutions for many different J.
        % Check  out "help LocalIntField"!!!
        
        %%%%%%% THE REST IS PLOTTING THE RESULT %%%%%%%%
        
        % Now plot true potential, inverted result, and data
        % location
        % First, plot true potential
        % plotplm uses sqrt(4pi) normalized spherical harmonics!!
        % Need to put this factor in here!
        lmcosi=coef2lmcosi(coef/sqrt(4*pi));
        clf;
        plotplm(lmcosi,[],[],2,res)
        title('True potential on planet surface')
        cax=caxis;
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        % Then plot inverted potential field on planet's surface. Again,
        % don't forget the sqrt(4*pi) factor!!
        figure
        result_lmcosi=coef2lmcosi(result_coef/sqrt(4*pi));
        plotplm(result_lmcosi,[],[],2,res)
        title('Inverted potential on planet surface from radial component data')
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        % Now plot the difference. Remember the sqrt(4*pi) factor!!
        figure
        diff_lmcosi=coef2lmcosi((coef - result_coef)/sqrt(4*pi));
        plotplm(diff_lmcosi,[],[],2,res)
        title('Difference between true and inverted potential fields')
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        
        % Then plot data lon/lat location of the random points
        figure
        plotplm([0 0 0 0;1 0 0 0;1 1 0 0],[],[],2,1)
        hold on 
        kelicol(1)
        [x,y,z]=sph2cart(phi,pi/2-theta,ones(size(phi)));
        plot3(x,y,z,'o')
        title(sprintf('Location of the %d data points',length(rad)))
        
        % And satellite altitude
        figure
        plot(rad-planetrad)
        title('Satellite altitude')
        xlabel('data point number')
        ylabel('planet radius - satellite radius')
 
        
        
    case 4
        % Region
        dom=[15.5 5.1];   
        rotcoords=[50 40];       
        %dom='africa';
        %rotcoords=[];
        plottype=2; % If you don't have the financial toolbox, 
        %turn this to 4 to plot on flat map 
        
        % Maximum spherical harmonic degree:
        Lmax=20;
        
        % How many Slepian functions for inversion
        % Here I just huess something random. One of the key difficulties
        % is getting good values for J!!!!
        %J=70; % for Africa example
        J=60; % For belt/rotcoords example 
        
        % The radius of the Planet, OR the sphere for which you want to
        % optimally find the coefficients is: 
        planetrad=6371;
        
        % The AVERAGE data altitude for which to construct the altitude 
        % Slepian functions:
        satrad=6371+400;
        % By how much would you like to vary the satellite altitude:
        varalt=100;
        
        % Seeding numer or random data points. WARNING: The actual number
        % of random points will be smaller!!!! Much smaller for irregular
        % regions or annuli with large inner opening angle.
        N=2000;  
        
        % Do you want to add random noise? If no, set this to 0. Otherwise
        % choose a value (see further down how it is used)
        noiselevel=0;
                
        % Plotting resolution (degrees per pixel):
        res=0.5;
        
        % We will need these
        [dems,~,~,~,~,mzo]=addmon(Lmax);
        
        
        % Make random model spherical harmonic coefficients or load them or
        % simply write them down, or make random field following a power
        % law. Here we just put in random for testing.
        % This is one of Frederik's random field generator functions
        rnd_lmcosi=plm2rnd(Lmax,0);
        % Transform this into ADDMON coefficient vector
        coef=lmcosi2coef(rnd_lmcosi);
        
        
        % This little script is located further down in "examples.m" It
        % generates equal-area-randomly located points within the target
        % region dom. The number of generated points will always be lower
        % than N!!!
        % It then for each point generates a random satellite altitude that
        % has a uniformly random distribution in 
        % [satrad-varalt/2 satrad+varalt/2]        
        [rad,theta,phi]=makerandpoints(dom,N,satrad,varalt,rotcoords);
                
        % Evaluate the function given by coef. We have an
        % efficient code for that
        data=rGvec(coef,theta,phi,rad,planetrad)';        
        
        % If you want you can now add noise to your data:        
        data=data + noiselevel*mean(abs(data))*rand(size(data)); 
        
               
        %%%%%% HERE IS THE DATA INVERSION %%%%%%%%
        
        % Now invert randomly generated data                
        result_coef=LocalIntField(data,rad,theta,phi,dom,Lmax,J,planetrad,satrad,rotcoords);        
        
        % Remark: You should give "LocalIntField" your chosen average
        % satellite radius "satrad" because otherwise it just takes the
        % average and calculates new Slepian functions from it.
        % also: "LocalIntField" has more input options if you want to save 
        % evaluated Slepian functions or give it preevaluated spherical
        % harmonics. This help a lot in reducing calculation costs if you
        % want to calculate solutions for many different J.
        % Check  out "help LocalIntField"!!!
        % Also, LocalIntField notices automatically if we are giving it
        % full vectorial data or just radial component
        
        %%%%%%% THE REST IS PLOTTING THE RESULT %%%%%%%%
        
        % Now plot true potential, inverted result, and data
        % location
        % First, plot true potential
        % Remember the sqrt(4pi) factor when plotting entire fields because
        % the function elm2xyz uses sqrt(4pi) normalized spherical
        % harmonics
        lmcosi=coef2lmcosi(coef/sqrt(4*pi));
        clf;
        plotplm(lmcosi,[],[],plottype,res)
        title('True potential on planet surface')
        cax=caxis;
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        % Then plot inverted potential field on planet's surface
        figure
        result_lmcosi=coef2lmcosi(result_coef/sqrt(4*pi));
        plotplm(result_lmcosi,[],[],plottype,res)
        title('Inverted potential on planet surface from full vectorial data')
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        % Now plot the difference
        figure
        diff_lmcosi=coef2lmcosi((coef-result_coef)/sqrt(4*pi));
        plotplm(diff_lmcosi,[],[],plottype,res)
        title('Difference between true and inverted potential fields')
        caxis([-1 1]*max(abs(cax)))
        kelicol(1)
        colorbar
        
        % Then plot data lon/lat location
        figure
        plotplm([0 0 0 0;1 0 0 0;1 1 0 0],[],[],plottype,1)
        hold on 
        kelicol(1)
        [x,y,z]=sph2cart(phi,pi/2-theta,ones(size(phi)));
        plot3(x,y,z,'o')
        title(sprintf('Location of the %d data points',length(rad)))
        
        % And satellite altitude
        figure
        plot(rad-planetrad)
        title('Satellite altitude')
        xlabel('data point number')
        ylabel('satellite radius - planet radius')
 
        
        
    case 5
        % Region
        dom=[15.5 5.1];   
        rotcoords=[50 40];       
        %dom='africa';
        %rotcoords=[];
        plottype=2; % If you don't have the financial toolbox, 
        %turn this to 4 to plot on flat map 
        
        % Maximum spherical-harmonic degree for internal field:
        %Lint=20;
        Lint=[10 40]; % Bandpass internal
        
        % Max spherical-harmonic degree for external field: 
        Lext=5;
        
        % How many Slepian functions for inversion
        % Here I just huess something random. One of the key difficulties
        % is getting good values for J!!!!
        J=70; % for Africa example
        %J=60; % For belt/rotcoords example 
        
        % The radius of the Planet, OR the sphere for which you want to
        % optimally find the coefficients is: 
        planetrad=6371;
        
        % The AVERAGE data altitude for which to construct the altitude 
        % Slepian functions:
        satrad=6371+400;
        % By how much would you like to vary the satellite altitude:
        varalt=100;
        maxrad=satrad+varalt;
        
        % Seeding numer or random data points. WARNING: The actual number
        % of random points will be smaller!!!! Much smaller for irregular
        % regions or annuli with large inner opening angle.
        N=2000;  
        
        % Do you want to add random noise? If no, set this to 0. Otherwise
        % choose a value (see further down how it is used)
        noiselevel=0;
                
        % Plotting resolution (degrees per pixel):
        res=0.5;
        
        % We will need these
        %[dems,~,~,~,~,mzo]=addmon(Lmax);
        
        
        % Make random model spherical harmonic coefficients or load them or
        % simply write them down, or make random field following a power
        % law. Here we just put in random for testing.
        % This is one of Frederik's random field generator functions
        rnd_lmcosi_int=plm2rnd(max(Lint),0);
        % Transform this into ADDMON coefficient vector
        coef_int=lmcosi2coef(rnd_lmcosi_int);
        % If it is bandpass, set the first few degrees to zero to make sure
        % that we are actually inverting for the right thing
        if length(Lint)==2
            coef_int(1:(min(Lint)+1)^2)=zeros((min(Lint)+1)^2,1);
        end
        clear rnd_lmcosi_int
        
        % And for the external field
        rnd_lmcosi_ext=plm2rnd(Lext,0);
        % External field can not have an L=0 component
        rnd_lmcosi_ext=rnd_lmcosi_ext(2:end,:);        
        % Transform this into ADDMON coefficient vector
        coef_ext=flmcosi2fcoef(rnd_lmcosi_ext);
        clear rnd_lmcosi_ext        
        
        % Total coefficient is ordered: internal field, then external field
        coef=[coef_int;coef_ext];
        
        % This little script is located further down in "examples.m" It
        % generates equal-area-randomly located points within the target
        % region dom. The number of generated points will always be lower
        % than N!!!
        % It then for each point generates a random satellite altitude that
        % has a uniformly random distribution in 
        % [satrad-varalt/2 satrad+varalt/2]        
        [rad,theta,phi]=makerandpoints(dom,N,satrad,varalt,rotcoords);
                
        % Evaluate the Slepian functions given by coef. We have an
        % efficient function for that
        data=rGvecInOut(coef,max(Lint),theta,phi,rad,planetrad,satrad)';        
        
        % If you want you can now add noise to your data:        
        data=data + noiselevel*mean(abs(data))*rand(size(data)); 
        
               
        %%%%%% HERE IS THE DATA INVERSION %%%%%%%%
        
        % Now invert randomly generated data                
        result_coef=LocalIntExtField(data,rad,theta,phi,dom,Lint,Lext,J,planetrad,maxrad,satrad,rotcoords);        
        
        % Remark: You should give "LocalIntField" your chosen average
        % satellite radius "satrad" because otherwise it just takes the
        % average and calculates new Slepian functions from it.
        % also: "LocalIntField" has more input options if you want to save 
        % evaluated Slepian functions or give it preevaluated spherical
        % harmonics. This help a lot in reducing calculation costs if you
        % want to calculate solutions for many different J.
        % Check  out "help LocalIntField"!!!
        % Also, LocalIntField notices automatically if we are giving it
        % full vectorial data or just radial component
        
        %%%%%%% THE REST IS PLOTTING THE RESULT %%%%%%%%
        
        % Now plot true potential, inverted result, and data
        % location
        % First, plot true potential
        % Remember the sqrt(4pi) factor when plotting entire fields because
        % the function elm2xyz uses sqrt(4pi) normalized spherical
        % harmonics
        
        % The coefficients for the internal component are the first
        % (Lint+1)^2 coefficients. Even if we do passband, then the first 
        % few coefficients will just be zero. 
        coef_int_true=coef(1:(max(Lint)+1)^2);
        coef_ext_true=coef((max(Lint)+1)^2+1:end);
        
        lmcosi_int_true=coef2lmcosi(coef_int_true/sqrt(4*pi));
        lmcosi_ext_true=fcoef2flmcosi(coef_ext_true/sqrt(4*pi));
        clf;
        plotplm(lmcosi_int_true,[],[],plottype,res)
        cax_int=caxis;
        title('True internal potential on planet surface')
        caxis([-1 1]*max(abs(cax_int)))
        kelicol(1)
        colorbar
        figure         
        plotplm(lmcosi_ext_true,[],[],plottype,res)
        cax_ext=caxis;
        title('True external potential on planet surface')        
        caxis([-1 1]*max(abs(cax_ext)))
        kelicol(1)
        colorbar
        
        % Then plot inverted potential field on planet's surface
        figure
        coef_int_result=result_coef(1:(max(Lint)+1)^2);
        coef_ext_result=result_coef((max(Lint)+1)^2+1:end);        
        lmcosi_int_result=coef2lmcosi(coef_int_result/sqrt(4*pi));
        lmcosi_ext_result=fcoef2flmcosi(coef_ext_result/sqrt(4*pi));        
        plotplm(lmcosi_int_result,[],[],plottype,res)
        title('Inverted internal potential on planet surface from full vectorial data')
        caxis([-1 1]*max(abs(cax_int)))
        kelicol(1)
        colorbar
        figure
        plotplm(lmcosi_ext_result,[],[],plottype,res)
        title('Inverted external potential on planet surface from full vectorial data')
        caxis([-1 1]*max(abs(cax_ext)))
        kelicol(1)
        colorbar
        
        % Now plot the difference
        figure
        diff_int_lmcosi=coef2lmcosi((coef_int_true-coef_int_result)/sqrt(4*pi));
        plotplm(diff_int_lmcosi,[],[],plottype,res)
        title('Difference between true and inverted internal potential fields')
        caxis([-1 1]*max(abs(cax_int)))
        kelicol(1)
        colorbar
        figure
        diff_ext_lmcosi=fcoef2flmcosi((coef_ext_true-coef_ext_result)/sqrt(4*pi));
        plotplm(diff_ext_lmcosi,[],[],plottype,res)
        title('Difference between true and inverted external potential fields')
        caxis([-1 1]*max(abs(cax_ext)))
        kelicol(1)
        colorbar
        
        % Then plot data lon/lat location
        figure
        plotplm([0 0 0 0;1 0 0 0;1 1 0 0],[],[],plottype,1)
        hold on 
        kelicol(1)
        [x,y,z]=sph2cart(phi,pi/2-theta,ones(size(phi)));
        plot3(x,y,z,'o')
        title(sprintf('Location of the %d data points',length(rad)))
        
        % And satellite altitude
        figure
        plot(rad-planetrad)
        title('Satellite altitude')
        xlabel('data point number')
        ylabel('satellite radius - planet radius')
 
        warning('If there is a significant error in the internal and/or external field reconstruction, try increasing the number J of Slepian functions used. Fir small J there is always a bias, see our paper "Internal and External potential field estimation ..."')
        
        
    case 6        
        % Generate matrix of internal and external Slepian functions  
        % for Eurasia for a low max degree
        % Choose maximum spherical-harmonic degree for internal field
        Lint=15;
        % and for external field
        Lext=5;
        [G,V]=inoutgradvecglmalpha('eurasia',Lint,Lext);
        % Let's pick the 5-th best suited Slepian functions
        index=5;
        coef=G(:,index);
        % Internal field is the first (Lint+1)^2 coefficients
        coefin=coef(1:(Lint+1)^2);
        coefout=coef((Lint+1)^2+1:end);
        
        % Let's export the radial derivative of the internal Slepian function:
        % dV/dr = B_r
        % Here, V is just the Slepian function potential field
        % Earth's radius
        planetrad=6371;
        % On the planet's surface
        alt=0;
        % Only radial
        cmpwrite=1; 
        % Resolution: 0.5 degrees per pixel
        res=0.5;
        % Remember, all glmalpha functions (including inoutgradvecglmalpha)
        % order the spherical-harmonic coefficients in ADDMOUT, so we need
        % to set onorout to 1.
        onorout=1;
        GMTexportfield(coefin,'Eurasia_internal',planetrad,alt,...
            cmpwrite,[],[],[],res,onorout);
        
        % Now export the external field
        GMTexportOutfield(coefout,'Eurasia_external',planetrad,alt,...
            cmpwrite,[],[],[],res,onorout)
        
        disp('Plot the resulting fields using GMT (http://gmt.soest.hawaii.edu/)')
        disp('For GMT 5, simply run the following two calls to transform the grd files into Mollweide')
        disp('Plot the resulting fields using GMT (http://gmt.soest.hawaii.edu/)')
        disp('For GMT 5, simply run the following three calls to plot the grd file in a Mollweide projection')
        disp(' ')
        disp('gmt grd2cpt Eurasia_internal_cmp1.nc -Cpolar -E100 -T= > colorscale.cpt')
        disp('gmt grdimage Eurasia_internal_cmp1.nc -Rg -JW0/20c -K -Ccolorscale.cpt > Eurasia_internal_cmp1.ps')
        disp('gmt pscoast -Rg -JW -W -O -K >> Eurasia_internal_cmp1.ps')
        disp(' ')
        disp('and mutatis mutandis for Eurasia_external')                      
                        
    otherwise
        error('Choose valid example option')
end


end

function coef=getcoefs(index,G,V,dom,Lmax)
    % The Slepian function coefficients are in ADDMOUT format.
    % Transform them into the ADDMON format
    G=out2on(full(G),Lmax);
    coef=G(:,index);
end
    
function [rad,theta,phi]=makerandpoints(dom,N,satrad,varalt,rotcoords)
    defval('rotcoords',[])
    % Now generate random points within target region
    if ischar(dom)
        [lon,lat]=randinpoly(dom,N);
        % Transform latitude into colatitude:
        cola=90-lat;
    else
        [lon lat]=randpatch(N,max(dom),0,0);
        % Transform latitude into colatitude:
        cola=90-lat;
        % Take out "inner cap"
        index=find(cola>=min(dom));
        lon=lon(index);
        lat=lat(index);
        cola=cola(index);
    end             
        
    % And give them random altitudes around satrad
    rad=satrad + (rand(length(lon),1)-0.5)*varalt;
    fprintf('Number of random points created: %d\n',length(lon))
    % Get theta and phi, which is in radians:
    theta=cola*pi/180;
    phi=lon*pi/180;

    % And rotate the points to the right location
    if ~isempty(rotcoords)
        [theta,phi]=rottp(theta,phi,0,-rotcoords(2)*pi/180,-rotcoords(1)*pi/180);
    end
    
    
    
    
end

