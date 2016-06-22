
echo
echo Downloading some additional octave functions
echo ============================================
echo

mkdir octave_funcs
cd octave_funcs

C:\"Program Files"\GnuWin32\bin\wget http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/strings/str2mat.m

C:\"Program Files"\GnuWin32\bin\wget http://lasp.colorado.edu/cism/CISM_DX/code/CISM_DX-0.50/required_packages/octave/share/octave/2.1.50/m/deprecated/setstr.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/meanm.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geoidtst.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/angledim.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/geod2aut.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/aut2geod.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/npi2pi.m

C:\"Program Files"\GnuWin32\bin\wget http://mooring.ucsd.edu/software/matlab/mfiles/toolbox/geo/private/epsm.m


cd ..
cd IFILES
cd COASTS

C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Africa.mat
C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Antarctica.mat
C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Australia.mat
C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Eurasia.mat
C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Namerica.mat
C:\"Program Files"\GnuWin32\bin\wget http://alainplattner.net/COASTS/Samerica.mat

cd ..
cd ..
