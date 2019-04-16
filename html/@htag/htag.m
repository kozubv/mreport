classdef (InferiorClasses = {? ht }) htag < handle
    
    properties
        prop = 1;
        
    end %--------------------------------------------------------
  
    
    properties (SetAccess = private)
        parent_ = nan;
        content_ = [];
        attributes_ = struct();
    end %--------------------------------------------------------
    
    
    properties (SetAccess = immutable)
        tag_ 
        unpaired_
    end %--------------------------------------------------------
    
    
    methods
        function obj = htag(content, tag, unpaired)
            if nargin == 0
               return; 
            end
            if nargin < 3
                unpaired = false;
            end
            if nargin < 2
                tag = 'text';
            end

            obj.tag_ = tag;
            if ~isempty(content)
                if strcmp(tag, 'text')
                    obj.content_ = content;
                elseif ischar(content)
                    obj.content_ = htag(content, 'text');
                else
                    obj.content_ = content;
                end
            elseif strcmp(tag, 'text')
                obj.content_ = char.empty();
            else
                obj.content_ = htag.empty();
            end
            obj.unpaired_ = unpaired;
        end %----------------------------------------------------
        
        
        % in standalone .m files
        obj = subsref(obj,s);
        obj = subsasgn(obj,s,varargin);
        str = print(obj, space);
        str = printformat(obj);
        item = find(obj, id);
        
        
        function flag = logical(obj)
            flag = ~isempty(obj.tag_);
        end %----------------------------------------------------
        
        
        function disp(obj)
            for n = 1 : length(obj)
                fprintf(['tag_ : ' mrep.lib.VarCapture(obj(n).tag_), '\n']);
                fprintf('content_ : ');
                if ~ischar(obj(n).content_)
                    for k = obj(n).content_
                       fprintf([k.tag_ '  ']); 
                    end
                else
                    fprintf(obj(n).content_);
                end
                fprintf('\n');                
                fprintf(['attributes_ :', '\n']);
                if ~isempty(fields(obj(n).attributes_))
                    fprintf([mrep.lib.VarCapture(obj(n).attributes_), '\n']);
                end
                fprintf('\n');
            end
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------



