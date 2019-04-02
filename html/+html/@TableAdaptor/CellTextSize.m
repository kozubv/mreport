function obj = CellTextSize( obj, index, size )
obj.validateIndex(index);
td = obj.getBody(index);
td.style('+', html.lib.strvar('font-size: $(size)px;', ...
                            'size', num2str(size)));
end %------------------------------------------------------------

