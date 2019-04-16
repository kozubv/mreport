classdef Image < mrep.Element
    %%
    %
    
    properties (SetAccess = private)
        filename_
        caption_ = 'image caption';
    end %--------------------------------------------------------
    
    properties 
        title
        height
        width
        titlePosition
        fontColor
        fontSize
        shadow
    end %--------------------------------------------------------
    
    
    methods
        function obj = Image(varargin)
            % case 0 : Image(img_path)  
            %          Image('image\folder\img0.png')
            %
            % case 1 : Image(plots_handle, img_file_name, img_folder)
            %          Image(figure, 'image1.bmp', 'image\folder')
            %
            % case 2 : Image(plots_handle, img_file_name, mrep.Report)
            %          Image(figure, 'image1.bmp', mreport_Object)
            
            if nargin == 1 && ischar(varargin{1})
                obj.filename_ = varargin{1};
            elseif isa(varargin{1}, 'matlab.graphics.axis.Axes') ...
                    || isa(varargin{1}, 'matlab.ui.Figure') ...
                    && (nargin == 2 || nargin == 3)
                if ischar(varargin{2}) && isa(varargin{3}, 'mrep.Page')
                    name = varargin{2};
                    page = varargin{3};
                    if isa(page, 'mrep.Report')
                        folder = page.folder_images_;
                    elseif isa(page, 'mrep.Page')
                        folder = page.report_.folder_images_;
                    end                    
                elseif ischar(varargin{2}) && ischar(varargin{3})
                    name = varargin{2};
                    folder = varargin{3};
                    if ~exist(folder, 'dir')
                        error('folder is not exist');
                    end
                else 
                    error('wrong input parameters');
                end
                obj.filename_ = mrep.lib.saveimage(varargin{1}, folder, name);
            end
        end %----------------------------------------------------
        
        
        function obj = caption(obj, caption)
            obj.caption_ = caption;
        end %----------------------------------------------------
        
        % abstract method from mrep.Element
        tree = htmlTree(obj, parent_page);
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------
