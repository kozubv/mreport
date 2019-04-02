function flag = isFolderEmpty( folder )
content = dir(folder);
names = {'.' '..'};
cnt = {content(:).name};
flag = all(cellfun(@(item) any(strcmp(item, names)), cnt));
end

