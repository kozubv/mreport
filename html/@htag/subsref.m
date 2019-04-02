function varargout = subsref(obj, s)

try 
    [varargout{1:nargout}] = builtin('subsref', obj, s);
    return
catch
    
end

N = length(s);
if strcmp(s(1).type, '.') ...   % case : obj.content_(value)    <=>   obj.content_ = value;
        && (N > 1 && s(1).subs(end) ~= '_') ...
        && ~ismethod(obj, s(1).subs)
    if ~isempty(s(2).subs)
        if length(s(2).subs) == 2 && s(2).subs{1} == '+' && isfield(obj.attributes_, s(1).subs) 
            % if obj.content_('+', value) : parameters concatenetion
            obj.attributes_.(s(1).subs) = [obj.attributes_.(s(1).subs) ' ' s(2).subs{2}];
        elseif length(s(2).subs) == 1 ...
                || (length(s(2).subs) == 2 && s(2).subs{1} == '+' && ~isfield(obj.attributes_, s(1).subs))
            obj.attributes_.(s(1).subs) = s(2).subs{end};
        end
    end
    tmp = obj;
    disp = 2;

elseif strcmp(s(1).type, '{}') % case : obj(index) <=> obj.content_(index)
    if length(s(1).subs) == 1
        tmp = obj.content_(s(1).subs{1});
        disp = 1;
    else
        error('{ nan }');
    end
    
elseif strcmp(s(1).type, '()') && ~isempty(s(1).subs) ... % case : find element by id - index
            && ischar(s(1).subs{1})
    tmp = obj.find(s(1).subs);
    disp = 1;
    
else % call builtin methods
    if N > 1 && strcmp(s(1).type, '.') && strcmp(s(2).type, '()')
        if strcmp(s(1).subs, 'content_')
            %obj.content_  = s(2).subs{1};
            obj = subsasgn(obj, struct('type', '.', 'subs', 'content_'), s(2).subs{1});
            tmp = obj;
        else
            tmp = builtin('subsref', obj, s(1:2));
        end
        disp = 2;
    else
        tmp = builtin('subsref', obj, s(1));
        disp = 1;
    end
end
if N > disp
    [varargout{1:nargout}] = subsref(tmp, s(disp + 1:end));
else 
    [varargout{1:nargout}] = tmp;
end
end










