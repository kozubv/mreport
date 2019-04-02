function obj = CellTextAlign( obj, index, align )
% $(hor)-$(vert)
%
obj.validateIndex(index);
td = obj.getBody(index);

str = strsplit(align, '-');
if length(str) ~= 2
   error(['wrong paremeter' '$(hor)-$(vert)']);
end

str = lower(str);
if any(strcmpi(str{1}, {'center' 'left' 'right' 'justify'}))
    td.style('+', html.lib.strvar('text-align :$(align);', 'align', str{1}));
else
    error(['wrong parameter' str(1)])
end

if any(strcmpi(str{2}, {'top' 'bottom' 'middle'}))
    td.style('+', html.lib.strvar('vertical-align :$(align);', 'align', str{2}));
else
    error(['wrong parameter' str(2)])
end
end %------------------------------------------------------------

