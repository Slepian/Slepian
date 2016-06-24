
echo
echo Downloading some additional octave functions
echo ============================================
echo

mkdir octave_funcs
cd octave_funcs

curl -o str2mat.m http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/strings/str2mat.m

curl -o setstr.m http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/deprecated/setstr.m

curl -o meanm.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/meanm.m

curl -o geoidtst.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geoidtst.m

curl -o angledim.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/angledim.m

curl -o geod2aut.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geod2aut.m

curl -o aut2geod.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/aut2geod.m

curl -o npi2pi.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/npi2pi.m

curl -o epsm.m http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/epsm.m

#curl -o ispolycw.m http://savannah.gnu.org/support/download.php?file_id=37343

cd ..
cd IFILES
cd COASTS

echo
echo For Octave: Downloading some coasts
echo

curl -o Africa.mat http://alainplattner.net/COASTS/Africa.mat
curl -o Antarctica.mat http://alainplattner.net/COASTS/Antarctica.mat
curl -o Australia.mat http://alainplattner.net/COASTS/Australia.mat
curl -o Eurasia.mat http://alainplattner.net/COASTS/Eurasia.mat
curl -o Namerica.mat http://alainplattner.net/COASTS/Namerica.mat
curl -o Samerica.mat http://alainplattner.net/COASTS/Samerica.mat
curl -o Greenland.mat http://alainplattner.net/COASTS/Greenland.mat
curl -o Ellesmere.mat http://alainplattner.net/COASTS/Ellesmere.mat
