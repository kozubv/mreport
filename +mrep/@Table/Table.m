classdef Table < mrep.Element
    
    properties
        data = mrep.Frame.empty;
    end %--------------------------------------------------------    
    
    methods
        function obj = Table(row, col)
            if nargin == 2
               obj.data(row, col) = mrep.Frame(); 
            end
        end %----------------------------------------------------
        
        
        function s = size(obj, varargin)
            s = size(obj.data, varargin{:});
        end %----------------------------------------------------
        
        %
        str = htmlTree(obj);
        obj = subsref(obj,s);
        obj = subsasgn(obj,s,varargin);
        row_names = getRowName(obj, index);
        col_names = getColName(obj, index);
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

