classdef Report < mrep.Page
    % 
    
    properties (Access = private)
        buffer_;                        % main html text buffer, which conteain report markup
        pages_ = mrep.Page.empty();     % list of related html pages
    end %--------------------------------------------------------
    
    
    properties (SetAccess = immutable)
        root_folder_     % root folder for report
        name_            % name of working folder
        folder_
        report_file_
        service_folder_
        folder_images_
        folder_html_
        file_config_
        folder_related_pages_
    end %--------------------------------------------------------
    
    
    properties (Constant)
        service_folder_name = 'mreport';
        images_folder_name = 'images';
        html_folder_name = 'html';
        file_config_name = 'mrep';
        file_config_ext = 'cfg';
    end %--------------------------------------------------------
    
    
    methods
        function obj = Report(folder, varargin)
            p = inputParser;
            addRequired(p, 'folder', @ischar);
            addParameter(p, 'name', 'mreport', @ischar);
            addParameter(p, 'flag_reset', false, @islogical);
            parse(p, folder, varargin{:});
            par = p.Results;
            
            pagefolder = fullfile(par.folder, par.name);
            obj = obj@mrep.Page(pagefolder, [par.name '.html']);
            
            obj.root_folder_ = par.folder;
            obj.name_ = par.name;
            obj.folder_ = fullfile(obj.root_folder_, obj.name_);
            obj.report_file_ = fullfile(obj.folder_, [obj.name_ '.html']);
            obj.service_folder_ = fullfile(obj.folder_, obj.service_folder_name);
            obj.folder_images_ = fullfile(obj.service_folder_, obj.images_folder_name);
            obj.folder_html_ = fullfile(obj.service_folder_, obj.html_folder_name);
            obj.file_config_ = fullfile(obj.service_folder_, ...
                                        [obj.file_config_name '.' obj.file_config_ext]);
            obj.folder_related_pages_ = obj.folder_;
            
            if par.flag_reset
                Resetfolder(obj.folder_);
            end
            ValidateRootFolder(obj.root_folder_);
            obj.InitializeWorkFolderContent();
        end %----------------------------------------------------
        
        
        % API methods
        Build(obj);
        page = Page(obj, name);
        %--------------------------------------------------------
        
    end %--------------------------------------------------------
    
    
    methods (Access = protected)
        function addPage(obj, page)
            validateattributes(page, {'mrep.Page'}, {'numel', 1});
            obj.pages_(end + 1) = page;
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
    
    methods (Access = private)
        function obj = push(obj, str)
            obj.buffer = 'a';
        end %----------------------------------------------------
        
        % utils
        content = ConfigFileContent(obj);
        status = InitializeWorkFolderContent(obj)
    end %--------------------------------------------------------  
    
    
    methods (Static)
        flag = isFolderMReport(folder);
    end %--------------------------------------------------------
    
end %------------------------------------------------------------




function ValidateRootFolder(root_folder)
    % check id folderectory is no empty

    if ~exist(root_folder, 'dir')
        error(['root folder is no exist : ' root_folder]);
    end
end %------------------------------------------------------------


function Resetfolder(folder)
    % clear folderectory if it conteain required content
    if mrep.Report.isFolderMReport(folder)
        mrep.lib.ClearFolder(folder, 'r');
    end
end %------------------------------------------------------------









