function obj = CellBorderColor( obj, index, color )
obj.validateIndex(index);
td = obj.getBody(index);
td.style('+', html.lib.strvar('border-color :$(color);', ...
                            'color', color));
end %------------------------------------------------------------

