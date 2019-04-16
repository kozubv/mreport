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

            ops.root_folder_ = par.folder;
            ops.name_ = par.name;
            ops.folder_ = fullfile(ops.root_folder_, ops.name_);
            ops.report_file_ = fullfile(ops.folder_, [ops.name_ '.html']);
            ops.service_folder_ = fullfile(ops.folder_, mrep.Report.service_folder_name);
            ops.folder_images_ = fullfile(ops.service_folder_, mrep.Report.images_folder_name);
            ops.folder_html_ = fullfile(ops.service_folder_, mrep.Report.html_folder_name);
            ops.file_config_ = fullfile(ops.service_folder_, ...
                                        [mrep.Report.file_config_name '.' mrep.Report.file_config_ext]);
            ops.folder_related_pages_ = ops.folder_;
            
            if par.flag_reset
                Resetfolder(ops.folder_);
            end
            ValidateRootFolder(ops.root_folder_);
            mrep.Report.InitializeWorkFolderContent(ops);
            
            pagefolder = fullfile(par.folder, par.name);
            obj = obj@mrep.Page(pagefolder, [par.name '.html']);
            
            obj.root_folder_ = ops.root_folder_;
            obj.name_ = ops.name_;
            obj.folder_ = ops.folder_;
            obj.report_file_ = ops.report_file_;
            obj.service_folder_ = ops.service_folder_;
            obj.folder_images_ = ops.folder_images_;
            obj.folder_html_ = ops.folder_html_;
            obj.file_config_ = ops.file_config_;
            obj.folder_related_pages_ = ops.folder_related_pages_;
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
        %content = ConfigFileContent(obj);
        %status = InitializeWorkFolderContent(obj)
    end %--------------------------------------------------------  
    
    
    methods (Static)
        flag = isFolderMReport(folder);
        status = InitializeWorkFolderContent(ops);
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









