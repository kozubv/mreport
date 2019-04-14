classdef Page < html.Page & mrep.Frame
    
    properties
        
    end %--------------------------------------------------------
    
    
    properties (SetAccess = immutable)
        report_ = mrep.Report.empty();
    end %--------------------------------------------------------
    
    
    methods
        function obj = Page(folder, pagename, report)
            validateattributes(folder, {'char'}, {'nonempty'});
            validateattributes(pagename, {'char'}, {});
            
            obj = obj@html.Page(folder, pagename);
            obj = obj@mrep.Frame();
            if nargin == 3
                validateattributes(report, {'mrep.Report'}, {});
                obj.report_ = report;
            end
            
        end %----------------------------------------------------

        
        function tree = htmlTree(obj)
            tree = htmlTree@mrep.Frame(obj, obj);
        end %----------------------------------------------------
        
        % API methods
        filename = Build(obj);
        %--------------------------------------------------------
        
    end %--------------------------------------------------------
    
end