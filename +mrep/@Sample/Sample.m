classdef Sample < mrep.Element
    %%
    %
    
    properties (SetAccess = private)
        content_ 
        sample_
    end %--------------------------------------------------------
    
    
    methods
        function obj = Sample(varargin)
            if nargin == 1
                obj.sample_ = varargin{1};
            end
        end %----------------------------------------------------
        
        
        % abstract method from mrep.Element
        tree = htmlTree(obj, parent_page);
        
    end %--------------------------------------------------------    
end

