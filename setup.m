function setup()

disp('Downloading the m-files from GitHub ..')

system('git clone https://github.com/csdms-contrib/slepian_alpha.git');
system('git clone https://github.com/csdms-contrib/slepian_bravo.git');
system('git clone https://github.com/csdms-contrib/slepian_charlie.git');
system('git clone https://github.com/csdms-contrib/slepian_delta.git');
system('git clone https://github.com/csdms-contrib/slepian_echo.git');
system('git clone https://github.com/csdms-contrib/slepian_foxtrot.git');
system('git clone https://github.com/csdms-contrib/slepian_golf.git');
system('git clone https://github.com/csdms-contrib/slepian_hotel.git');
system('git clone https://github.com/csdms-contrib/slepian_juliet.git');

system('git clone https://github.com/Slepian/grdwrite2p.git');

disp('Creating folder structure ..')
mkdir('IFILES');
cd('IFILES');
mkdir('COASTS');
cd('COASTS');

disp('Downloading data files from geoweb.princeton.edu')
websave('cont.mtl','http://geoweb.princeton.edu/people/simons/DOTM/cont.mtl');
websave('conm.mat','http://geoweb.princeton.edu/people/simons/DOTM/conm.mat');
websave('cost.mtl','http://geoweb.princeton.edu/people/simons/DOTM/cost.mtl');
websave('platm.mat','http://geoweb.princeton.edu/people/simons/DOTM/platm.mat');
cd('..')
mkdir('EARTHMODELS');
cd('EARTHMODELS');
mkdir('CONSTANTS');
cd('CONSTANTS');
websave('Earth.mat','http://geoweb.princeton.edu/people/simons/DOTM/Earth.mat');
cd('..');
cd('..');
mkdir('COLORMAPS');
cd('COLORMAPS');
websave('kelim.mat','http://geoweb.princeton.edu/people/simons/DOTM/kelim.mat');
cd('..');
mkdir('KERNELCP');
mkdir('KERNELC');
mkdir('KERNELB');
mkdir('SDWCAP');
mkdir('GLMALPHA');
mkdir('GLMALPHAPTO');
mkdir('GLMALPHAPTOJ');
mkdir('GRADVECGLMALPHA');
mkdir('LEGENDRE');
mkdir('LOCALIZE');
mkdir('PLATES');
cd('PLATES');
websave('plates.mtl','http://geoweb.princeton.edu/people/simons/DOTM/plates.mtl');
cd('..');
mkdir('RADSLEPIANS');
mkdir('TANSLEPIANS');
mkdir('TANCAP');
mkdir('WIGNER');
cd('WIGNER');
mkdir('0J');
cd('..');
mkdir('DLMB');
mkdir('GLACIERS');
cd('GLACIERS');
mkdir('RGI_3_2');
cd('..');
mkdir('PSALLCONS');
mkdir('GRADVECGLMALPHA');
mkdir('INOUTGRADVECGLMALPHA');
mkdir('OUTGRADVECGLMALPHA');
mkdir('TORVECGLMALPHA');
mkdir('TORVECGLMALPHATOJ');

cd('..');

disp('.. done')
