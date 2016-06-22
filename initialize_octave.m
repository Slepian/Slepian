%graphics_toolkit('fltk')

% See if function nanmean is already loaded. If not, load package.
% If package is not installed, download and install it.
% This may take a few minutes.
try nanmean
catch
  try pkg load statistics
  catch
    disp('Installing statistics pkg from forge. This may take a minute.')
    pkg install -forge statistics
    disp('done')
    pkg load statistics
  end
end

addpath('./octave_funcs')
initialize