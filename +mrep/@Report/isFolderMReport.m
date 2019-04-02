function flag = isFolderMReport( work_folder )

flag = false;
config_file = fullfile(work_folder, mrep.Report.service_folder_name, ...
                        [mrep.Report.file_config_name '.' ....
                         mrep.Report.file_config_ext]);
if exist(config_file, 'file')
    % check confog content 
    flag = true;
end
end %------------------------------------------------------------


