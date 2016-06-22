%graphics_toolkit('fltk')

% Try to load packages.
% If package is not installed, download and install it.
% This may take a few minutes.

try pkg load statistics
catch
    disp('Installing statistics pkg from forge. This may take a minute.')
    pkg install -forge statistics
    disp('done')
    pkg load statistics
end


try pkg load mapping
catch
	disp('Installing mapping pkg from forge. This may take a minute.')
    pkg install -forge mapping
    disp('done')
    pkg load mapping
end

disp('Installing geometry pkg from forge. This may take a minute.')
    pkg install -forge geometry
    disp('done')
    pkg load geometry
end

addpath('./octave_funcs')
initialize

try poly2cw
catch
	disp('poly2cw does not yet exist in the mapping or geometry toolbox.')
	disp('This will lead to problems when trying to prepare named regions.')
	disp('Hopefully poly2cw will become available soon in the Octave mapping or geometry package.')
	disp('Try updating your packages by running:')
	disp('pkg update')
end