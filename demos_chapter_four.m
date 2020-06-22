function demos_chapter_two(wht)
% Demo to show the outputs of examples in Chapter 2: Introduction to Slepian Functions.
%
% INPUT:
%
% wht           select corresponding subsection
%
% 4.1    
%
%

switch wht
    case 4.1
	clear all
	% Building Plm
	l = 2
	m = -1
	P2m1 = plm(l,m);

	% Building BlmClm
	theta = -90:0.5:90;
	phi   = 0:0.5:360;
	[B2m1,C2m1] = blmclm(l,m,(90-theta)*pi/180,phi*pi/180); % default is ADDMOUT ordering
	
	% Reshaping and Plotting background of radial values:
	% P2m1 = reshape(P2m1,length(theta),length(phi));
	plotplm(P2m1,phi,pi/2-theta,4);
	kelicol(1)
	caxis([-1,1]*max(abs(caxis)))
	hold on

	% Reshaping theta and phi components:
	B2m1{1} = reshape(B2m1{1},length(theta),length(phi)); % theta
	B2m1{2} = reshape(B2m1{2},length(theta),length(phi)); % phi	

	% Using quiver() to plot theta and phi components:
	quiver(phi*180/pi,90-theta*180/pi,B2m1{1},B2m1{2},'k','LineWidth',1)
	hold off
	xlabel('Longitude [degrees]')
	ylabel('Latitude [degrees]')


end
