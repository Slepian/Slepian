function demos_chapter_two(wht)
% Demo to show the outputs of examples in Chapter 2: Introduction to Slepian Functions
%
% INPUT:
%
% wht           select corresponding subsection
%
% 2.1	 Calculating Coefficients for a Region
% 2.2	 Calculating Coefficients for an Axisymmetric Polar Cap
% 2.3	 Calculating Coefficients for a Polar Ring
% 2.4	 Rotating a Polar Cap or Ring
% 3.0	 Linear Combinations of Classical Scalar Slepian Functions
% 4.0	 Looking at Eigenvalues
%
%
%
%

switch wht
    case 2.1
        clear all
        % 2.1 Calculating coefficients for a region
        [G] = glmalpha('africa',20,[],0)

        % converting to lmcosi format
        lmcs = coef2lmcosi(G(:,1),1)

        % evaluating scalar coefficients
        data = plm2xyz(lmcs,0.5)

        % plotting Mollweide projection
        figure
        plotplm(data,[],[],1,0.5)

        % resetting color scheme min/max
        kelicol(1)
        caxis([-1,1]*max(abs(caxis)))

    case 2.2
        clear all

        % 2.2 Calculating coefficients for an Axisymmetric Polar Cap
        [G] = glmalpha(40,20,1,0)

        % converting to lmcosi format
        lmcs = coef2lmcosi(G(:,1),1)

        % evaluating scalar coefficients
        data = plm2xyz(lmcs,0.5)

        % plotting to Mollweide projection
        figure
        plotplm(data,[],[],1,0.5)
        kelicol(1)
        caxis([-1,1]*max(abs(caxis)))

	% plotting looking down at North Pole
	figure
	plotplm(data,[],[],5,0.5)
	kelicol(1)
	caxis([-1,1]*max(abs(caxis)))

    case 2.3
        clear all
        % 2.3 Calculating coefficients for an Axisymmetric Polar Ring
        [G] = glmalpha(40,20,2,0)

        % converting to lmcosi format
        lmcs = coef2lmcosi(G(:,1),1)

        % evaluating scalar coefficients
        data = plm2xyz(lmcs,0.5)

        % plotting to Mollweide projection
        figure
        plotplm(data,[],[],1,0.5)

        % resetting color scheme min/max
        kelicol(1)
        caxis([-1,1]*max(abs(caxis)))

    case 2.4
	clear all	
	% 2.4 Rotating coefficientsfor a Polar Cap
	[G] = glmalphaptoJ(40,20,180,90,[],50)
	
	% converting to lmcosi format
	lmcs = coef2lmcosi(G(:,1),1)

	% evaluating scalar coefficients
	data = plm2xyz(lmcs,0.5)

	% plotting to Mollweide projections
	figure
	plotplm(data,[],[],1,0.5)

	% resetting color scheme min/max
	kelicol(1)
	caxis([-1,1]*max(abs(caxis)))

    case 3.0
	clear all
	% 3.0 Linear Combinations of Slepian Functions
	[G] = glmalpha('namerica',20,[],0)

	% converting to lmcosi format and adding functions
	lmcs = coef2lmcosi((5*G(:,1))+(3*G(:,1)),1)

	% evaluating scalar coefficients
	data = plm2xyz(lmcs,0.5)

        % plotting to Mollweide projections
        figure
        plotplm(data,[],[],1,0.5)

        % resetting color scheme min/max
        kelicol(1)
        caxis([-1,1]*max(abs(caxis)))

    case 4.0
	clear all
	% 4.0 Looking at Eigenvalues
	L = 20

	[G,V] = glmalpha('namerica',L,[],0)

	% Plotting eigenvalues versus slepian function number
	figure
	plot(1:((L+1)^2),V)	
	ylabel('eigenvalue \lambda')
	xlabel('Slepian Function #')	

	% Setting J. 
	J = 50

	% converting to lmcosi and evaluating all Slepian functions up to 'J'
	for j=1:J
	    g{j} = plm2xyz(coef2lmcosi(G(:,j),1),.5)
        end

	% creating matrix and making linear combination of all Slepian functions up to 'J' multiplied by vector of random coefficients 'u' and length 'J'
	u = randn(J,1)
	f = zeros(size(g{1}))
	for j=1:J
	    f = f + u(j)*g{j}
	end

	% Plotting f
	figure
	plotplm(f,[],[],1,.5)
	kelicol(1)
	caxis([-1,1]*max(abs(caxis)))
	 
end
