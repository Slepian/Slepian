



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
