
echo
echo Downloading some additional octave functions
echo ============================================
echo

mkdir octave_funcs
cd octave_funcs

wget http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/strings/str2mat.m

wget http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/deprecated/setstr.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/meanm.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geoidtst.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/angledim.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geod2aut.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/aut2geod.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/npi2pi.m

wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/epsm.m

cd ..
cd IFILES
cd COASTS

echo
echo For Octave: Downloading some coasts
echo

wget http://alainplattner.net/COASTS/Africa.mat
wget http://alainplattner.net/COASTS/Antarctica.mat
wget http://alainplattner.net/COASTS/Australia.mat
wget http://alainplattner.net/COASTS/Eurasia.mat
wget http://alainplattner.net/COASTS/Namerica.mat
wget http://alainplattner.net/COASTS/Samerica.mat
