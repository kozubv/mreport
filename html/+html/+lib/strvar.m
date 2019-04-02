function str = strvar( strtemplate, varargin )
% strtemplate example:
%   str = 'some string with $(variable), and may be $(second)'
%   $(variable)
%   $(fieldwidth, variable)         - align="left"
%   $(fieldwidth, align, variable)

expression = '\$\(.*?\)';
matches = regexp(strtemplate, expression,'match');

if mod(length(varargin), 2) == 1
   error('parameters is name-value pair, length need be even');
end

param = containers.Map(varargin(1:2:end-1), varargin(2:2:end));

vars = struct('varname', {}, 'width', {}, 'align', {});
varnames = {};
for n = 1:length(matches)
    [vars(n).width, vars(n).align, vars(n).varname] = ...
                parseParameters(matches{n});
    varnames{end + 1} = vars(n).varname;
end

reminder_params = setdiff(keys(param), varnames);
if ~isempty(reminder_params)
    error(['uncknown parameters : ' evalc('disp(reminder_params)')]);
end

str = strtemplate;
for n = 1:length(matches)
    if ~isempty(vars(n).width)
        line = '';
        space_num = vars(n).width - length(param(vars(n).varname));
        space_num(space_num < 0) = 0;
        switch vars(n).align
            case 'left'
                line = [param(vars(n).varname) ...
                        repmat(' ', 1, space_num)];
            case 'center'
                line = [repmat(' ', 1, floor(space_num/2)) ...
                        param(vars(n).varname) ...
                        repmat(' ', 1, fix(space_num/2))];                
            case 'right'
                line = [repmat(' ', 1, space_num) ...
                        param(vars(n).varname)];                
            otherwise 
                error(['wrong align string parameter : ' vars(n).align]);
        end
        str = strrep(str, matches{n}, line);
    else
        str = strrep(str, matches{n}, param(vars(n).varname));
    end
end

end % -----------------------------------------------------------


function [width, align, varname] = parseParameters(param)
    content = param(3:end-1);
    if ~isempty(strfind(content, '$')) ...
            || ~isempty(strfind(content, '(')) ...
            || ~isempty(strfind(content, ')'))
       error('parameter can not contein inclusive parameter, or characters "$", "(", ")"'); 
    end
    split = regexp(content, '[\w\\\|\/\:]*(?=[ ]*[,.;:|\/]?[ ]*)', 'match');
    width = [];
    align = [];
    varname = [];
    switch length(split)
        case 1
            varname = split{1};
        case 2
            width = split{1};
            align = 'left';
            varname = split{2};
        case 3
            width = split{1};
            align = split{2};
            varname = split{3};
        otherwise
            error([content ': wrong parameter number']);
    end
    
    if ~isempty(width)
        num = str2double(width);
        if isempty(num) || floor(num) ~= num
            error([content ': param :' width ': must be integer number']);
        end
        width = num;
    end
    
    if ~isempty(align)
        align = lower(align);
        if ~any(strcmpi(align, {'left' 'center' 'right', 'l', 'c', 'r'}));
            error([content ': ' align ': can be only: "left" "center" "right"']);
        end
        switch align
            case 'l',
                align = 'left';
            case 'c'
                align = 'center';
            case 'r'
                align = 'right';
        end
    end
end %------------------------------------------------------------












