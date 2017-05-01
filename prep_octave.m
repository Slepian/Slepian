function prep_octave()

disp('Downloading some additional octave functions');

mkdir('octave_funcs');
cd('octave_funcs');

urlwrite('http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/strings/str2mat.m','str2mat.m'); 

urlwrite('http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/deprecated/setstr.m','setstr.m'); 

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/meanm.m','meanm.m'); 

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geoidtst.m','geoidtst.m'); 

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/angledim.m','angledim.m');

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geod2aut.m','geod2aut.m');

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/aut2geod.m','aut2geod.m'); 

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/npi2pi.m','npi2pi.m');

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/epsm.m','epsm.m');

urlwrite('http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/meanm.m','meanm.m');

% urlwrite('http://savannah.gnu.org/support/download.php?file_id=37343','ispolycw.m')

disp('.. done')

cd('..');
cd('IFILES');
cd('COASTS');

disp('For Octave: Downloading some coasts')

urlwrite('http://alainplattner.net/COASTS/Africa.mat','Africa.mat');
urlwrite('http://alainplattner.net/COASTS/Antarctica.mat','Antarctica.mat'); 
urlwrite('http://alainplattner.net/COASTS/Australia.mat','Australia.mat');
urlwrite('http://alainplattner.net/COASTS/Eurasia.mat','Eurasia.mat');
urlwrite('http://alainplattner.net/COASTS/Namerica.mat','Namerica.mat');
urlwrite('http://alainplattner.net/COASTS/Samerica.mat','Samerica.mat');
urlwrite('http://alainplattner.net/COASTS/Greenland.mat','Greenland.mat');
urlwrite('http://alainplattner.net/COASTS/Ellesmere.mat','Ellesmere.mat');
cd('..');
cd('..');


disp('.. done')
  
