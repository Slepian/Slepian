Prerequisites
-------------

You need the following command line programs:

wget
git

If you don't have them you will need to manually download the data
files from the website
http://geoweb.princeton.edu/people/simons/software.html


Installation
------------

Place setup.sh into a folder in which you want to install the software

Run

./setup.sh

After starting Octave or Matlab, run

initialize

in the same folder as the script "setup.sh" is

The m-file "vectordemos.m" contains a few demos. To run it, save it in the same folder 
as the script "setup.sh" and within Matlab or Octave, run

vectordemos(1)

etc.  

For Octave you may need to install some additional packages like the
io package, the statistics package, the mapping package etc. Just run

pkg install -forge io
pkg install -forge statistics
etc.
