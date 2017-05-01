# Welcome to the Slepian installation instructions!

This repository contains installation and demo files for the Slepian software to install all prerequisites from the repository slepian_alpha, etc.

The software runs on [Matlab](http://www.mathworks.com/products/matlab/) and [Octave](https://www.gnu.org/software/octave/), which you can obtain for free from https://www.gnu.org/software/octave/download.html 

There is also a folder containing introductory texts: [edu](https://github.com/Slepian/Slepian/tree/master/edu).
Check out for example the [tutorial to spherical harmonics](https://github.com/Slepian/Slepian/tree/master/edu/Ch_01_SphericalHarmonics/Ch_01_SphericalHarmonics_tut.pdf). 
 

## Installation instructions
To be able to use the installation functions setup.m and, in case you are using Octave, the Octave prep function prep_octave.m, you will need to have Git installed:

https://git-scm.com/download/win

Once git is installed, open a Command Prompt window, switch to the folder in which you would like to install the Slepian software, and run

`git clone https://github.com/Slepian/Slepian.git`

Once the repository is cloned start Matlab or Octave, change to your newly created directory `Slepian` and, in Octave or Matlab, run the setup function

`setup()`

#### Running in Octave
To finalize the instalation for Octave, run in Octave

`prep_octave()`

this is only necessary the first time you are using the software.

To initialize the software (set paths, etc), run in Octave

`initialize_octave`

The first time you run `initialize_octave`, the program will take a while to complete because it downloads and installs necessary additional octave packages. 
Once the packages are installed, octave will simply load them when running this script. This will be much faster.

To also load/install advanced packages that will only run if your system has the corresponding programs installed (NetCDF, GDAL), run

`initialize_octave_adv`

If the package installation for the advanced packages fails you will still be able to use most functions.  
Some special functions such as export to GMT may not work but this can be fixed at a later time (install NetCDF and run `initialize_octave_adv` again).

You will need to run `initialize_octave` (and `initialize_octave_adv`, if required) every time you start Octave but it will only install the packages once, so it will be much faster the next time you run it.

After that you are ready to go. Try out 

`vectordemos(2)`

etc.


#### Running in Matlab
After starting Matlab, switch into the Slepian folder and run in Matlab

`initialize`

After that you are ready to go. Try out 

`vectordemos(1)`

etc.

If some of the demos run into problems you may be missing the Mapping Toolbox or other Matlab toolboxes. You can either purchase them from MathWorks or try out Octave (see above).


## Keeping the software updated
This repository and all the slepian_alpha etc repositories are regularly updated. To keep your software up to date I included the Matlab/Octave function 

`update_all()` 

To avoid conflicts when updating I recommend that if you change any of provided files in your folder, that you rename them. This way, an update will simply overwrite the provided files and will ignore your new functions/files/scripts.

Please let us know if you run into any issues.
 





