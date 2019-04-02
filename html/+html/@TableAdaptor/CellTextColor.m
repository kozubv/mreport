function obj = CellTextColor( obj, index, color )
obj.validateIndex(index);
td = obj.getBody(index);
td.style('+', html.lib.strvar('color :$(color);', ...
                            'color', color));
end %------------------------------------------------------------

