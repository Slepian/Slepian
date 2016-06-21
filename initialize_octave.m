initialize

%graphics_toolkit('fltk')

addpath('./octave_funcs')

% See if function nanmean is already loaded. If not, load package.
% If package is not installed, download and install it.
try nanmean
catch
  try pkg load financial
  catch
    pkg install -forge financial
  end
end


