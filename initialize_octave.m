%graphics_toolkit('fltk')

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
