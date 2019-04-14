classdef (Abstract = true) Element < handle
    
    methods (Abstract = true)
        html = htmlTree(obj, parent_page);
    end %--------------------------------------------------------
    
    
    methods
        function str = print(obj)
            str = obj.htmlContent().print();
        end %----------------------------------------------------
        
        
        function str = printformat(obj)
            str = obj.htmlContent().printformat();
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

