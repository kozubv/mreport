function ClearFolder(folder, arg_recursive)

flag_recursive = (nargin == 2 && validatestring(arg_recursive, {'r' 'R' '-r' '-R'}));

if exist(folder, 'dir')
    content = dir(folder);
    for n = 1:length(content)
        item = content(n);
        if any(strcmp(item.name, {'.' '..'}))
           continue 
        end
        if item.isdir && flag_recursive
           mrep.lib.ClearFolder(fullfile(folder, item.name), 'r');
           rmdir(fullfile(folder, item.name));
        else
            delete(fullfile(folder, item.name));
        end
    end
else
    error('dir is nor exist')
end

end %------------------------------------------------------------

