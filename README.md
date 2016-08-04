#Welcome to the Slepian wiki!

This repository contains installation and demo files for the Slepian software to install all prerequisites from the repository slepian_alpha, etc.

The software runs on [Matlab](http://www.mathworks.com/products/matlab/) and [Octave](https://www.gnu.org/software/octave/), which you can obtain for free from https://www.gnu.org/software/octave/download.html 

There is also a folder containing introductory texts: [edu](https://github.com/Slepian/Slepian/tree/master/edu).
Check out for example the [tutorial to spherical harmonics](https://github.com/Slepian/Slepian/tree/master/edu/Ch_01_SphericalHarmonics/Ch_01_SphericalHarmonics_tut.pdf). 
 

##Installation instructions for Windows
To be able to use the installation scripts setup_windows.bat and, in case you are using Octave, the Octave prep script prep_octave.bat, you will need to have the following two programs installed:

Git:
https://git-scm.com/download/win

wget:
https://sourceforge.net/projects/gnuwin32/files/wget/1.11.4-1/wget-1.11.4-1-setup.exe/

Once they are installed, open a Command Prompt window, switch to the folder in which you would like to install the Slepian software, and run

`git clone https://github.com/Slepian/Slepian.git`

Once the repository is cloned, switch to it

`cd Slepian`

and run the setup script

`setup_windows.bat`

This will set up the folder structure and download some additional data files. Continue below depending on if you are using Octave or Matlab.

#### Running under Octave
To run the software in Octave, which you can obtain [here](https://www.gnu.org/software/octave/) for free, 
you will need to run

`prep_octave.bat`

before starting Octave.

After starting Octave, switch into the Slepian folder and run in Octave

`initialize_octave`

This may install some additional Octave packages required to run the software. 
You will need to run `initialize_octave` every time you start Octave but it will only install the packages once, so it will be much faster the next time you run it.

After that you are ready to go. Try out 

`vectordemos(1)`

etc.


#### Running under Matlab
After starting Matlab, switch into the Slepian folder and run in Matlab

`initialize`

After that you are ready to go. Try out 

`vectordemos(1)`

etc.

If some of the demos run into problems you may be missing the Mapping Toolbox or other Matlab toolboxes. You can either purchase them from MathWorks or try out Octave (see above).


##Installation instructions for Mac/Linux/Unix
To be able to use the installation scripts setup.sh and, in case you are using Octave, the Octave prep script prep_octave.sh, you will need to have the following two programs installed:

**Git:**
https://git-scm.com/

**curl:**
For Mac: It should already be installed. If not, you can get it from package managers such as [MacPorts](https://www.macports.org/), [Homebrew](http://brew.sh/), etc.
For Linux: If it's not already installed you can use a package manager such as apt-get.

Once they are installed, open a Terminal window, switch to the folder in which you would like to install the Slepian software, and run

`git clone https://github.com/Slepian/Slepian.git`

Once the repository is cloned, switch to it

`cd Slepian`

and run the setup script

`./setup.sh`

This will set up the folder structure and download some additional data files. Continue below depending on if you are using Octave or Matlab.

#### Running under Octave
To run the software in Octave, which you can obtain [here](https://www.gnu.org/software/octave/) for free, 
you will need to run

`prep_octave.sh`

before starting Octave.

After starting Octave, switch into the Slepian folder and run in Octave

`initialize_octave`

This may install some additional Octave packages required to run the software. 
You will need to run `initialize_octave` every time you start Octave but it will only install the packages once, so it will be much faster the next time you run it.

After that you are ready to go. Try out 

`vectordemos(1)`

etc.


#### Running under Matlab
After starting Matlab, switch into the Slepian folder and run in Matlab

`initialize`

After that you are ready to go. Try out 

`vectordemos(1)`

etc.

If some of the demos run into problems you may be missing the Mapping Toolbox or other Matlab toolboxes. You can either purchase them from MathWorks or try out Octave (see above).


##Keeping the software updated
This repository and all the slepian_alpha etc repositories are regularly updated. To keep your software up to date I included the scripts

`update_all.sh` 

for Linux/Mac/Unix

and

`update_all.bat`

for Windows.

To avoid conflicts when updating I recommend that if you change any of provided files in your folder, that you rename them. This way, an update will simply overwrite the provided files and will ignore your new functions/files/scripts.

Please let us know if you run into any issues.
 





