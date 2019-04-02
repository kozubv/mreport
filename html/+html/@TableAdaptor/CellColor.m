function obj = CellColor( obj, index, color )
obj.validateIndex(index);
td = obj.getBody(index);
td.style('+', html.lib.strvar('background-color :$(color);', ...
                            'color', color));
end %------------------------------------------------------------

