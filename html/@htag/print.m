function str = print(obj, space)
if nargin == 1
    space = '';
end
if strcmp(obj.tag_, 'text')
    str = obj.content_;
    return;
end
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
attributes = '';
fields = fieldnames(obj.attributes_);
for n = 1:length(fields)
    field = fields{n};
    if ~isempty(field)
        attr = [' ' strrep(field, '_', '-') '="' obj.attributes_.(field) '"' ];
        attributes = horzcat(attributes, attr);
    end
end
open_tag = ['<' obj.tag_  attributes '>'];
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
content = '';
for n = 1:length(obj.content_)
    item = obj.content_(n);
    if strcmp(item.tag_, 'text')
        if length(obj.content_) == 1 ...
                && isempty(find(item.content_ == char(10), 1))
            content = horzcat(content, item.content_);
        else
            pad_spase = space;
            if strcmp(obj.tag_, 'pre')
                pad_spase = '';
            else
                pad_spase = space;
            end
            item_print = [strrep(item.content_, char(10), [char(10) pad_spase])];
            content = horzcat(content, [char(10) pad_spase item_print]);
        end
    else
        item_print = item.print([space '    ']);
        content = horzcat(content, [char(10) item_print]);
    end
end
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if ~obj.unpaired_
    close_tag = ['</' obj.tag_ '>'];
else
    close_tag = '';
end
if isempty(obj.content_)
    str = [space open_tag close_tag];
elseif length(obj.content_) == 1 && strcmp(obj.content_(end).tag_, 'text') ...
        && isempty(find(obj.content_(end).content_ == char(10), 1))
    str = [space open_tag content close_tag];
else
    str = [space open_tag content char(10) space close_tag];
end
end %------------------------------------------------------------

