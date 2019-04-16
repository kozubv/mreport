classdef Sample < mrep.Element
    %%
    %
    
    properties (SetAccess = private)
        var_ 
        sample_
        argin_
    end %--------------------------------------------------------
    
    
    methods
        function obj = Sample(var, varargin)
            obj.sample_ = mrep.lib.printvar(var, varargin{:});
            obj.var_ = var;
            obj.argin_ = varargin;
        end %----------------------------------------------------
        
        
        % abstract method from mrep.Element
        tree = htmlTree(obj, parent_page);
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

