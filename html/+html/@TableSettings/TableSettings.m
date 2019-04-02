classdef TableSettings
    %%
    %
    
    properties
        table_sizing
        cell_width
        cell_heigth
        margin
        caption
        name_back_color
        border_color
        cell_border_color
        col_labels_orientation
    end %--------------------------------------------------------
    
    
    methods
        function obj = TableSettings()
            
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
    
    properties (Constant)
        % 
        table_sizing_type   = {'compact' 
                               'normal' 
                               'full' 
                               'square-cells' 
                               'inclusive'};
                           
        cell_width_type     = {'compact' 
                               'normal' 
                               'full' 
                               'uniform'};
                           
        cell_haight_type    = {'compact' 
                               'normal' 
                               'uniform'};
        
        table_margin        = {'hor-center' 
                               'vert-center' 
                               'left' 
                               'right'};
                           
        caption_side        = {'top' 
                               'bottom'};
                           
        overflow_type       = {'hide' 
                               'elipsis' 
                               'auto-scroll'};
    end %--------------------------------------------------------
    
end %------------------------------------------------------------










