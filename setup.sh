# This script downloads all the functions and sets up the folder structure

# First download the m-files
echo
echo Downloading the m-files from GitHub
echo ===================================
echo 
git clone https://github.com/csdms-contrib/slepian_alpha.git
#git clone https://github.com/AlainPlattner/slepian_alpha.git
git clone https://github.com/csdms-contrib/slepian_bravo.git
git clone https://github.com/csdms-contrib/slepian_charlie.git
git clone https://github.com/csdms-contrib/slepian_delta.git
git clone https://github.com/csdms-contrib/slepian_echo.git
git clone https://github.com/csdms-contrib/slepian_foxtrot.git
git clone https://github.com/csdms-contrib/slepian_golf.git
git clone https://github.com/csdms-contrib/slepian_hotel.git 

git clone https://github.com/Slepian/grdwrite2p.git

echo
echo Creating folder structure
echo =========================
echo
# Then make the datafile directory
mkdir IFILES

# And get many of the things we will need
cd IFILES
mkdir COASTS
cd COASTS
echo
echo Downloading data files from geoweb.princeton.edu
echo ================================================
echo
curl -o cont.mtl http://geoweb.princeton.edu/people/simons/DOTM/cont.mtl
curl -o conm.mat http://geoweb.princeton.edu/people/simons/DOTM/conm.mat
curl -o cost.mtl http://geoweb.princeton.edu/people/simons/DOTM/cost.mtl
curl -o platm.mat http://geoweb.princeton.edu/people/simons/DOTM/platm.mat
cd ..
mkdir EARTHMODELS
cd EARTHMODELS
mkdir CONSTANTS
cd CONSTANTS
curl -o Earth.mat http://geoweb.princeton.edu/people/simons/DOTM/Earth.mat
cd ..
cd ..
mkdir COLORMAPS
cd COLORMAPS
curl -o kelim.mat http://geoweb.princeton.edu/people/simons/DOTM/kelim.mat
cd ..
mkdir KERNELCP
mkdir KERNELC
mkdir KERNELB
mkdir SDWCAP
mkdir GLMALPHA
mkdir GRADVECGLMALPHA
mkdir LEGENDRE
mkdir RADSLEPIANS
mkdir TANSLEPIANS
mkdir TANCAP
mkdir WIGNER
mkdir DLMB
mkdir GLACIERS
cd GLACIERS
mkdir RGI_3_2
cd ..
mkdir PSALLCONS
mkdir GRADVECGLMALPHA
mkdir INOUTGRADVECGLMALPHA
mkdir OUTGRADVECGLMALPHA
mkdir TORVECGLMALPHA
mkdir TORVECGLMALPHATOJ

echo
echo ...done!
