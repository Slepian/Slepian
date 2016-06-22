Before using the Slepian functions for the first time, run

for Unix systems like Mac or Linux:
./prep_octave.sh

for Windows:
prep_octave.bat

To download additionally needed octave programs. 


After starting Octave, run

initialize_octave

to add the slepian_* folders to your path and to set the variables. 
This is necessary every time you start Matlab to use the Slepian functions.

The first time you run initialize_octave, the program will check if you have 
all the necessary Octave packages installed and will load them. In case the 
packages are not yet installed, the program will automatically obtain them from 
Octave-Forge and install them. This may take a few minutes. 

The m-file "vectordemos.m" contains a few demos. To run it, save it in the same folder 
as the script "setup.sh" and within Matlab or Octave, run

vectordemos(1)

etc.  

For Octave you may need to install some additional packages like the
io package, the statistics package, the mapping package etc. Just run

pkg install -forge io
pkg install -forge statistics
etc.
