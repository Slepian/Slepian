


echo
echo Downloading the m-files from GitHub
echo ===================================
echo 
git clone https://github.com/csdms-contrib/slepian_alpha.git

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

mkdir IFILES


cd IFILES
mkdir COASTS
cd COASTS
echo
echo Downloading data files from geoweb.princeton.edu
echo ================================================
echo
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/cont.mtl
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/conm.mat
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/cost.mtl
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/platm.mat
cd ..
mkdir EARTHMODELS
cd EARTHMODELS
mkdir CONSTANTS
cd CONSTANTS
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/Earth.mat
cd ..
cd ..
mkdir COLORMAPS
cd COLORMAPS
C:\"Program Files"\GnuWin32\bin\wget http://geoweb.princeton.edu/people/simons/DOTM/kelim.mat
cd ..
mkdir KERNELCP
mkdir KERNELC
mkdir KERNELB
mkdir SDWCAP
mkdir GLMALPHA
mkdir GRADVECGLMALPHA
mkdir LEGENDRE
mkdir LOCALIZE
mkdir RADSLEPIANS
mkdir TANSLEPIANS
mkdir TANCAP
mkdir WIGNER
cd WIGNER
mkdir 0J
cd ..
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


cd ..

echo
echo ...done!
