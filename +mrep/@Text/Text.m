classdef Text < mrep.Element
    
    properties 
        text
    end %--------------------------------------------------------
    
    
    methods
        function obj = Text(text)
            if nargin == 0
                text = 'default-text-in-mrep-Text';
            end
            obj.text = text;
        end %----------------------------------------------------
        
        
        function str = htmlTree(obj)
            str = ht.p(obj.text);
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

