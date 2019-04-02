function str = print(obj)
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
        attr = [' ' field '="' obj.attributes_.(field) '"' ];
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
            item_print = strrep(item.content_, char(10), [char(10) '    ']);
            content = horzcat(content, [char(10) '    ' item_print]);
        end
    else
        item_print = item.print();
        item_print = strrep(item_print, char(10), [char(10) '    ']);
        content = horzcat(content, [char(10) '    ' item_print]);
    end
end
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if ~obj.unpaired_
    close_tag = ['</' obj.tag_ '>'];
else
    close_tag = '';
end
if isempty(obj.content_)
    str = [open_tag close_tag];
elseif length(obj.content_) == 1 && strcmp(obj.content_(end).tag_, 'text') ...
        && isempty(find(obj.content_(end).content_ == char(10), 1))
    str = [open_tag content close_tag];
else
    str = [open_tag content char(10) close_tag];
end
end %------------------------------------------------------------

