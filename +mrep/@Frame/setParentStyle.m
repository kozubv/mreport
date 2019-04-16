function obj = setParentStyle( obj, parent )
apply_backColor(obj, parent);
apply_textColor(obj, parent);
apply_textSize(obj, parent);
apply_textAlign(obj, parent);
apply_textStyle(obj, parent);
apply_borderColor(obj, parent);
apply_borderWidth(obj, parent);

%parent.style('+', 'width: 1%;');
if ~isempty(obj.content_)
    if true %isa(obj.content_{1}, 'mrep.Table')
        %parent.style('+', 'padding: 0px 0px 0px 0px;');
        %parent.style('+', 'width: 1%;');
    end
end

end %------------------------------------------------------------


function obj = apply_class(obj, div)
if ~isempty(obj.class)
    div.class('+', obj.class);
end
end %------------------------------------------------------------


function obj = apply_backColor(obj, div)
if ~isempty(obj.backColor)
    div.style('+', ...
        html.lib.strvar('background-color: $(color);', 'color', obj.backColor));
end
end %------------------------------------------------------------


function obj = apply_textColor(obj, div)
if ~isempty(obj.textColor);
    div.style('+', html.lib.strvar('color :$(color);', 'color', obj.textColor));
end
end %------------------------------------------------------------


function obj = apply_textSize(obj, div)
if ~isempty(obj.textSize)
    div.style('+', html.lib.strvar('font-size: $(size)px;', 'size', num2str(obj.textSize)));
end
end %------------------------------------------------------------


function obj = apply_textAlign(obj, div)
if isempty(obj.textAlign)
    return
end

str = lower(obj.textAlign);
str = strsplit(str);
for n = 1 : length(str)
    if any(strcmpi(str{n}, {'center' 'left' 'right' 'justify'}))
        div.style('+', html.lib.strvar('text-align :$(align);', 'align', str{n}));
    end
    if any(strcmpi(str{n}, {'top' 'bottom' 'middle'}))
        div.style('+', html.lib.strvar('vertical-align :$(align);', 'align', str{n}));
    end
end
end %------------------------------------------------------------


function obj = apply_textStyle(obj, div)
if isempty(obj.textStyle)
    return
end
style = strsplit(obj.textStyle);
for n = 1:length(style)
    if any(strcmpi(style{n}, {'bold' 'lighter'}))
        div.style('+', html.lib.strvar('font-weight: $(weigth);', ...
                                        'weigth', style{n}));
    elseif any(strcmpi(style{n}, {'italic'}))
        div.style('+', html.lib.strvar('font-style: $(style);', ...
                                        'style', style{n}));
    end
end
end %------------------------------------------------------------


function obj = apply_borderColor(obj, div)
if isempty(obj.borderColor)
    return
end
div.style('+', html.lib.strvar('border-color :$(color);', ...
                            'color', obj.borderColor));
end %------------------------------------------------------------


function obj = apply_borderWidth(obj, div)
if isempty(obj.borderWidth)
    return
end
width = obj.borderWidth;
if length(width) == 1
    div.style('+', html.lib.strvar('border-width :$(width)px;', 'width', num2str(width)));
elseif length(width) == 4
    div.style('+', html.lib.strvar('border-width :$(top)px $(right)px $(bottom)px $(left)px;', ...
                                    'top', num2str(width(1)), ...
                                    'right', num2str(width(2)), ...
                                    'bottom', num2str(width(3)), ...
                                    'left', num2str(width(4))));
else 
    error('width size can be only 1 or 4 [top right bottom left]')
end
end %------------------------------------------------------------
