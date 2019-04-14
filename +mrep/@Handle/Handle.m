classdef Handle < mrep.Element
    
    properties (SetAccess = immutable)
        level_ = 1;
        anchor_id
    end %--------------------------------------------------------
    
    
    properties 
        content
    end %--------------------------------------------------------
    
    
    methods
        function obj = Handle(varargin)
            p = inputParser;
            addOptional(p, 'level', 1, @(x) any(x == [1 2 3]));
            addOptional(p, 'content', '', @ischar);
            parse(p, varargin{:});
            par = p.Results;
            obj.level_ = par.level;
            obj.content = par.content;
            obj.anchor_id = strrep(obj.content, ' ', '-');
        end %----------------------------------------------------
        
        
        function tag = htmlTree(obj, parent_page)
            switch obj.level_
                case 1
                    tag = ht.h1();
                case 2
                    tag = ht.h2();
                case 3
                    tag = ht.h3();
                otherwise
                    error('wrong level');
            end    
            tag.content_ = [ht.a().id(obj.anchor_id) obj.content];
        end %----------------------------------------------------     
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

