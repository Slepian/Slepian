%graphics_toolkit('fltk')

% Try to load packages.
% If package is not installed, download and install it.
% This may take a few minutes.

try pkg load io
catch
  disp('Installing io pkg from forge. This may take a while.')
  pkg install -forge io
  disp('done')
  pkg load io
end

try pkg load statistics
catch
    disp('Installing statistics pkg from forge. This may take a while.')
    pkg install -forge statistics
    disp('done')
    pkg load statistics
end

try pkg load mapping
catch
    disp('Installing mapping pkg from forge. This may take a while.')
    pkg install -forge mapping
    disp('done')
    pkg load mapping
end

addpath('./octave_funcs')
initialize

try poly2cw
catch
	warning('poly2cw does not yet exist in the mapping package.')
%	disp('This will lead to problems when trying to prepare named regions.')
%	disp('Hopefully poly2cw will become available soon in the Octave mapping or geometry package.')
%	disp('Try updating your packages by running:')
%	disp('pkg update')
end

try polybool
catch 
	warning('polybool does not yet exist in the mapping package.')
end
