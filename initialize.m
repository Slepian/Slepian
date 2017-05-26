setenv('IFILES','./IFILES')
setenv('OSTYPE','linux')
%setenv('OSTYPE','solaris')
disp('If you are using a Solaris machine, change the OSTYPE setting in initialize.m')

addpath('./slepian_alpha')
addpath('./slepian_alpha/REGIONS')
addpath('./slepian_bravo')
addpath('./slepian_charlie')
addpath('./slepian_delta')
addpath('./slepian_echo')
% addpath('./slepian_foxtrott')
addpath('./slepian_golf')
addpath('./slepian_hotel')
addpath('./slepian_hotel/MGS')

addpath('./grdwrite2p')

