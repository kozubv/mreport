function obj = CellTextStyle( obj, index, varargin)
obj.validateIndex(index);

td = obj.getBody(index);
for n = 1:length(varargin)
    if any(strcmpi(varargin{n}, {'bold' 'lighter'}))
        td.style('+', html.lib.strvar('font-weight: $(weigth);', ...
                                        'weigth', varargin{n}));
    elseif any(strcmpi(varargin{n}, {'italic'}))
        td.style('+', html.lib.strvar('font-style: $(style);', ...
                                        'style', varargin{n}));
    end
end

end %------------------------------------------------------------

