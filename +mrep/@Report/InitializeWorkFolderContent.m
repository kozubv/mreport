function InitializeWorkFolderContent(obj)
    if ~exist(obj.root_folder_, 'dir')
        error(['root_folder is not exist : ' root_folder]);
    end
    
    if exist(obj.folder_, 'dir')
       if ~mrep.lib.isFolderEmpty(obj.folder_)
           error(['work folder need be empty : ' obj.folder_]);
       end
    else
        [status, msg] = mkdir(obj.folder_);
        if ~status
           error([ msg ' : ' obj.folder_]);
        end
    end
    
    InitializeServiceFolderContent(obj);
end %------------------------------------------------------------


function InitializeServiceFolderContent(obj)
    if ~mrep.lib.isFolderEmpty(obj.folder_);
        error(['work folder is not empty : ' obj.folder_]);
    end
    
    mkdir(obj.service_folder_);
    mkdir(obj.folder_images_);
    mkdir(obj.folder_html_);
    
    fid = fopen(obj.file_config_, 'w');
    try
        fprintf(fid, ['defaoult content' mfilename]);
    catch ERR
        fclose(fid);
        rethrow(ERR);
    end
    fclose(fid);
end %------------------------------------------------------------