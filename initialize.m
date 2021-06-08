setenv('IFILES','./IFILES')
setenv('OSTYPE','linux')
%setenv('OSTYPE','solaris')
disp('If you are using a Solaris machine, change the OSTYPE setting in initialize.m')

% To make these functions accessible from another folder,
% edit the Slepian directory below and copy this file over 
slepdir = '.';


addpath(fullfile(slepdir,'slepian_zero'))
addpath(fullfile(slepdir,'slepian_alpha'))
addpath(fullfile(slepdir,'slepian_alpha/REGIONS'))
addpath(fullfile(slepdir,'slepian_bravo'))
addpath(fullfile(slepdir,'slepian_charlie'))
addpath(fullfile(slepdir,'slepian_delta'))
addpath(fullfile(slepdir,'slepian_echo'))
% addpath('./slepian_foxtrott')
addpath(fullfile(slepdir,'slepian_golf'))
addpath(fullfile(slepdir,'slepian_hotel'))
addpath(fullfile(slepdir,'slepian_hotel/MGS'))
addpath(fullfile(slepdir,'slepian_juliet'))
addpath(fullfile(slepdir,'nonZonalSlepians'))


addpath(fullfile(slepdir,'grdwrite2p'))

