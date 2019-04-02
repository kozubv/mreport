classdef Handle < mrep.Element
    
    properties (SetAccess = immutable)
        level_ = 1;
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
        end %----------------------------------------------------
        
        
        function tag = htmlTree(obj)
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
            tag.content_ = obj.content;
        end %----------------------------------------------------     
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

