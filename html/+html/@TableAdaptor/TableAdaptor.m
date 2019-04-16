classdef TableAdaptor < handle
    
    properties
        table
        tbody
        thead
        tfoot
        caption
        namesCornerCell     
    end %--------------------------------------------------------
    
    
    properties (Dependent, Hidden = true)
        height
        width
        rows 
        rowLabels         % array[hd.td]
        colLabels
        rowOrigin
        colOrigin
    end %--------------------------------------------------------
    
    
    properties (SetAccess = private, Hidden = true)
        has_row_names_ = false;
        has_col_names_ = false;
    end %--------------------------------------------------------
    
    
    methods
        function obj = TableAdaptor()
            obj.table = ht.table();
            obj.caption = ht.caption();
            obj.thead = ht.thead();
            obj.tfoot = ht.tfoot();
            obj.tbody = ht.tbody();
            obj.table.content_ = [obj.caption obj.thead obj.tfoot obj.tbody];
            obj.namesCornerCell = ht.th();
        end %----------------------------------------------------
        
        
        function h = get.height(obj)
            h = length(obj.tbody.content_(obj.rowOrigin : end));
        end %----------------------------------------------------
        
        function w = get.width(obj)
            w = length(obj.row(obj.rowOrigin).content_) - obj.colOrigin + 1;
        end %----------------------------------------------------        
        
        function rows = get.rows(obj)
            rows = obj.tbody.content_(obj.rowOrigin:end);
        end %----------------------------------------------------   
        
        function labels = get.colLabels(obj)
            if ~obj.has_col_names_
                %error('table has no row labels');
                labels = htag.empty();
                return
            end
            labels = obj.tbody.content_(obj.rowOrigin - 1).content_;
        end %----------------------------------------------------
        
        function labels = get.rowLabels(obj)
            if ~obj.has_row_names_
                %error('table has no col labels');
                labels = htag.empty();
                return;
            end
            labels = htag.empty();
            for n = 1:obj.height
                labels = [labels obj.row(n).content_(1)];
            end
        end %----------------------------------------------------
        
        function index = get.rowOrigin(obj)
            index = double(obj.has_col_names_) + 1;
        end %----------------------------------------------------
        
        
        function index = get.colOrigin(obj)
            index = double(obj.has_row_names_) + 1;
        end %----------------------------------------------------
        
        
        % API methods
        obj = setBody(obj, index2, content);
        td  = getBody(obj, index2);
        tr  = row(obj, index1);
        td  = col(obj, index1)
        obj = setTitle(obj, title);
        obj = setRowLabels(obj, labels);
        obj = setColLabels(obj, labels);
        array = RowLabel(obj, index);
        array = ColLabel(obj, index);
        
        %       cell settings
        obj = CellColor(obj, index, color);
        %       text
        obj = CellTextColor(obj, index, align);
        obj = CellTextSize(obj, index, size);
        obj = CellTextAlign(obj, index, align);
        obj = CellTextStyle(obj, varargin);
        %       border
        obj = CellBorderColor(obj, index, color);
        obj = CellBorderWidth(obj, index, width);
        %--------------------------------------------------------
        
    end %--------------------------------------------------------
    
    
    methods (Access = private)
        function validateIndex(obj, index)
            % throw error if validation false
            validateattributes(index, {'numeric'}, {'numel', 2});
            err = '';
            if any(floor(index) ~= index)
                err = 'index mast be integer';
            end
            if index(1) > obj.height
                err = 'index(1) exceed rows dim';
            end
            if index(2) > obj.width
                err = 'index(2) exceed columns dim';
            end
            if index(1) == 0 && ~obj.has_col_names_
               err = 'index(1) == 0, but table has no __columns__ labels';
            end
            if index(2) == 0 && ~obj.has_row_names_
               err = 'index(2) == 0, but table has no __rows__ labels';
            end            
            if ~isempty(err)
               error(err);
            end
        end
    end %--------------------------------------------------------
    
end %------------------------------------------------------------











