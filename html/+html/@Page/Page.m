classdef Page < handle
    %%
    %
    
    properties (SetAccess = immutable, GetAccess = private)
        folder_         % html file will be created in this folder
        name_           % html file will be named like this
        title_ 
        sidebar_style_ 
        header_style_
    end %--------------------------------------------------------
    
    
    properties
        head
        style       %  
        body        % 
        header      % according HTML5 semantic elements
        main        % HTML5 semantic
        aside       % HTML5 semantic
        comments
    end %--------------------------------------------------------
    
    
    methods
        function obj = Page(folder, name, varargin)
            p = inputParser;
            addParameter(p, 'title', '', @ischar);
            parse(p, varargin{:});
            par = p.Results;
            
            if ~ValidateFolder(folder)
                error('folder is not exist');
            end
            obj.folder_ = folder;
            obj.name_ = name;
            title = strsplit(obj.name_, '.');
            obj.title_ = title{1};
            if isempty(obj.title_)
               name_ext = strsplit(obj.name_, '.'); 
               obj.title_ = name_ext{1};
            end
            
            obj.InitHead();
            obj.InitBody();
            obj.InitStyle();
        end %----------------------------------------------------
        
        
        function obj = SidebarStyle(obj, varargin)
            if nargin == 1
                obj.sidebar_style_ = varargin{1};
            end
        end %----------------------------------------------------

        
        function obj = HeaderStyle(obj, varargin)
            if nargin == 1
                obj.header_style_ = varargin{:};
            end
        end %----------------------------------------------------
        
        
        function str = name(obj)
            str = obj.name_;
        end %----------------------------------------------------
        
        
        function str = title(obj)
            str = obj.title_;
        end %----------------------------------------------------
        
        
        function str = pageFile(obj)
            str = fullfile(obj.folder_, obj.name_);
        end %----------------------------------------------------
        
        
        % 
        err = Build(obj);
        obj = LinkCSS(file);
    end %--------------------------------------------------------
    
    
    methods 
        obj = InitHead(obj);
        obj = InitBody(obj);
        obj = InitStyle(obj);
        obj = WriteComments(obj);
    end %--------------------------------------------------------
    
end %------------------------------------------------------------


function flag = ValidateFolder(folder)
    flag = exist(folder, 'dir');
end %------------------------------------------------------------












