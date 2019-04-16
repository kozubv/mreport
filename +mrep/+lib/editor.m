function editor
close all
%  Create and then hide the UI as it is being constructed.
f = figure('Visible','on','Position',[360,500,450,285], ...
            'MenuBar', 'none', ...
            'ToolBar', 'none');

hedit1 = uicontrol('parent', f, 'Style', 'edit', ...
    'units', 'normalized', ...
    'Position',[0.05 0.51 0.9 0.45], ...
    'max', 64, ...
    'HorizontalAlignmen', 'left', ...
    'fontname', 'FixedWidth', ...
    'callback', @edit_collback, ...
    'ButtonDownFcn', @edit_button_down, ...
    'KeyPressFcn', @edit_key_press, ...
    'KeyReleaseFcn', @edit_key_release);

hedit2 = uicontrol('parent', f, 'Style', 'edit', ...
    'units', 'normalized', ...
    'Position',[0.05 0.05 0.9 0.45], ...
    'max', 3, ...
    'HorizontalAlignmen', 'left', ...
    'fontname', 'FixedWidth');

%align([hedit1, hedit2], 'distribute','bottom');

hedit1.Units = 'normalized';
hedit2.Units = 'normalized';


% ===============================================================
    function edit_collback(source, eventdata)
%         disp('edit_collback');
%         str = transform(source.String);
%         hedit2.String = str;
        %hedit2.String = evalc('cprintf(''-comment'', source.String)');
        
    end %------------------------------------------------------------


    function edit_button_down(source, eventdata)
%         disp('edit_button_down');
        
    end %------------------------------------------------------------


    function edit_key_press(source, eventdata)
%         disp('edit_key_press');
        
    end %------------------------------------------------------------


    function edit_key_release(source, eventdata)
        %disp('edit_key_release');
        source.String;
        str = transform(source.String, 35);
        hedit2.String = str;
    end %------------------------------------------------------------
end %------------------------------------------------------------


function str = transform(text, len)
linenum = size(text, 1);
str = {};
for n = 1 : linenum
    out = transformString(text(n, :), len);
    str = [str out];
end

for n = 1 : length(str)
    post = ''' ...';
    str{n} = ['''' str{n} repmat(' ', 1, len + 1 - length(str{n})) post];
%   str{n}(len + 1 : len + length(post)) = post;
%   str{n} = strrep(str{n}, char(0), '.');
%   str{n} = ['"' str{n}];
end
str = ['[ ...' str];
str{end} = strcat(str{end}(1:end-3), '];');
end %------------------------------------------------------------


function str = transformString(line, len)
line = regexp(line, '.*[\S](?=[\s]*)', 'match');
if isempty(line)
    str = repmat(' ', 1, len);
    return
end
line = line{1};
if line(end) ~= ' '
    line(end + 1) = ' ';
end
wrap = wraptext(line, len);
str = strsplit(wrap, char(10));
if all(isspace(str{end}))
   str(end) = []; 
end

% N = fix(length(line)/len);
% rm = rem(length(line), len);
% str = [];
% for n = 1:N
%     str = [str; line((n-1)*len + 1 : n*len)];
% end
% if rm ~= 0
%     str = [str; line(end - rm + 1 :end) repmat(' ', 1, len - rm)];
% end
% disp(str)
end %------------------------------------------------------------




