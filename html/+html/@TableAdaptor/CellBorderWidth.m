function obj = CellBorderWidth( obj, index, width)
obj.validateIndex(index);
td = obj.getBody(index);
if length(width) == 1
    td.style('+', html.lib.strvar('border-width :$(width)px;', 'width', num2str(width)));
elseif length(width) == 4
    td.style('+', html.lib.strvar('border-width :$(top)px $(right)px $(bottom)px $(left)px;', ...
                                    'top', num2str(width(1)), ...
                                    'right', num2str(width(2)), ...
                                    'bottom', num2str(width(3)), ...
                                    'left', num2str(width(4))));
else 
    error('width size can be only 1 or 4 [top right bottom left]')
end
end %------------------------------------------------------------

