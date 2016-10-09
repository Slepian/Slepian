

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

try pkg load netcdf
catch
    disp('Installing netcdf pkg from forge. This may take a while.')
    try
    	pkg install -forge netcdf
    catch 
    	disp('NetCDF package installation failed.')
    	disp('For now: Export to GMT disabled.')
    	disp('To enable export to GMT, install netcdf on your system')
    	disp('and try again installing the packages')
    end
    disp('done')
    pkg load netcdf
end

% try pkg load geometry
%     disp('Installing geometry pkg from forge. This may take a while.')
%     pkg install -forge geometry
%     disp('done')
%     pkg load geometry
% end
