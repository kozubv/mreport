classdef Image < mrep.Element
    %%
    %
    
    properties (SetAccess = private)
        filename_
    end %--------------------------------------------------------
    
    properties 
        title
        height
        width
        titlePosition
        fontColor
        fontSize
        shadow
    end %--------------------------------------------------------
    
    methods
        function obj = Image(varargin)
            if nargin == 1 && ischar(varargin{1})
                obj.filename_ = varargin{1};
            end
        end %----------------------------------------------------
        
        % abstract method from mrep.Element
        tree = htmlTree(obj);
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

