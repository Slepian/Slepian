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

	% Using quiver() to plot
		




end
