classdef Text < mrep.Element
    
    properties 
        text
    end %--------------------------------------------------------
    
    
    methods
        function obj = Text(text)
            if nargin == 0
                text = 'default-text-in-mrep-Text';
            end
            obj.text = strrep(text, char(10), '<br>');
        end %----------------------------------------------------
        
        
        function str = htmlTree(obj, parent_page)
            str = ht.p(obj.text);
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

