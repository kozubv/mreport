classdef Frame < handle
    %% contain cell array of report items
    % provide wrap functions for access to element ant some properties
    
    properties %(Access = private)
        content_ = {}
    end %--------------------------------------------------------
    
    
    properties
        var
        class
        backColor
        textColor
        textSize
        textAlign
        textStyle
        borderColor
        borderWidth
    end %--------------------------------------------------------
    
    
    methods
        function obj = Frame()
        end %----------------------------------------------------
        
        % definition in standalone files
        item = h1(obj, content);
        item = h2(obj, content);
        item = h3(obj, content);
        item = text(obj, content);
        item = table(obj, varargin);
        item = image(obj, varargin);
        item = sample(obj, varargin);
        
        str = print(obj);
        content = htmlTree(obj, parent_page);
        setParentStyle(obj, parent);
        %--------------------------------------------------------
        
        
        function item = get(obj, varargin)
            if length(varargin) == 1 && rem(varargin{1}, 1) == 0
                item = obj.content_{varargin{1}};
            else
                error('wrong access')
            end
        end %----------------------------------------------------
        
        function tb = mrep.Table(obj)
            tb = mrep.Table(1, 1);
            tb.content_ = obj.content_;
        end %----------------------------------------------------
        
        
        function obj = pushback(obj, item)
            obj.content_{end + 1} = item;
        end %----------------------------------------------------
        
        
        function obj = pushfront(obj, item)
            obj.content_ = [item obj.content_];
        end %----------------------------------------------------
        
        
        function list = ContentClass(obj)
            list = {};
            for n = 1:length(obj.content_)
                list{end + 1} = class(obj.content_{n});
            end
        end %----------------------------------------------------
        
        
        function flag = isempty(obj)
            flag = isempty(obj.content_);
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

