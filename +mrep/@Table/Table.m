classdef Table < mrep.Frame & mrep.Element
    
    properties
        row_label_ = mrep.Frame.empty;
        col_label_ = mrep.Frame.empty;
    end %--------------------------------------------------------    
    
    
%     properties (Dependent)
%         rownum
%         colnum
%     end %--------------------------------------------------------
    
    
    methods
        function obj = Table(row, col)
            if nargin == 2
               obj(row, col) = mrep.Table(); 
            end
        end %----------------------------------------------------
                     
        function num = rownum(obj)
            num = size(obj, 1);
        end %----------------------------------------------------

        function num = colnum(obj)
            num = size(obj, 2);
        end %----------------------------------------------------
        
        function lb = rowLabel(obj, index)
            if nargin == 1
                index = 1:obj.rownum();
            end
            validateattributes(index, {'numeric'}, {'positive'})
            if index > obj.rownum()
               error('index exceeds'); 
            end
            if obj.rownum() > length(obj(1).row_label_)
                obj(1).row_label_(obj.rownum()) = mrep.Frame();
            end
            lb = obj(1).row_label_(index);
        end %----------------------------------------------------

        function lb = colLabel(obj, index)
            if nargin == 1
                index = 1:obj.colnum();
            end
            validateattributes(index, {'numeric'}, {'positive'})
            if index > obj.colnum()
               error('index exceeds'); 
            end
            if obj.colnum() > length(obj(1).col_label_)
                obj(1).col_label_(obj.colnum()) = mrep.Frame();
            end            
            lb = obj(1).col_label_(index);
        end %----------------------------------------------------
        
        %
        str = htmlTree(obj);
        obj = subsref(obj,s);
        obj = subsasgn(obj,s,varargin);
        row_names = getRowName(obj, index);
        col_names = getColName(obj, index);
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------

