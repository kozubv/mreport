function element = find(obj, id)
try
    element = [];
    for item = obj.content_
        if isfield(item.attributes_, 'id') && strcmp(item.attributes_.id, id)
            element = item;
            break;
        end
    end
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if ~isempty(element)
        return;
    end
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    for item = obj.content_
        if strcmp(item.tag_, 'text')
            continue;
        end
        element = item.find(id);
        if ~isempty(element)
            break;
        end
    end
catch ME
    warning(ME.getReport);
end
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
end

