function obj = subsasgn(obj, s, varargin)
if strcmp(s(1).type, '()') ...
        && length(s(1).subs) == 2
    %&& isnumeric(s(1).subs{1}) && isnumeric(s(1).subs{2})
    %% vactorise asign
    flag_value_assign = (length(s) == 1);
    if s(1).subs{1}  == ':'
        n_index = 1:size(obj, 1);
    else
        n_index = s(1).subs{1};
    end
    if s(1).subs{2}  == ':'
        k_index = 1:size(obj, 2);
    else
        k_index = s(1).subs{2};
    end
    if length(varargin) == 1 && length(n_index) == 1 && length(k_index) == 1
        if ~flag_value_assign
            sup = @(n, k) struct('type', {s.type}, 'subs', {{n k} s(2:end).subs});
            value = @(n, k) varargin{1};
        else
            error('flag_value_assign')
        end
    elseif length(varargin) == 1 && (length(varargin{1}) == 1 || ischar(varargin{1}))
        if flag_value_assign
            % issign other matlab type object for frame.var in element
            sup = @(n, k) struct('type', {'()' '.'}, 'subs', {{n k} 'var'});
            if iscell(varargin{1})
                %error('you can not asign cell array');
                value = @(n, k) varargin{1}{1};
            else
                value = @(n, k) varargin{1};
            end
        elseif ~flag_value_assign
            sup = @(n, k) struct('type', {s.type}, 'subs', {{n k} s(2:end).subs});
            if iscell(varargin{1})
                value = @(n, k) varargin{1}{1};
            else
                value = @(n, k) varargin{1};
            end
        end
    elseif length(varargin) == 1 && size(varargin{1}, 1) == length(n_index) ...
            && size(varargin{1}, 2) == length(k_index)
        if flag_value_assign
            % issign other matlab type object for frame.var in element
            sup = @(n, k) struct('type', {'()' '.'}, 'subs', {{n k} 'var'});
            value = @(n, k) varargin{1}(n, k);
        elseif ~flag_value_assign
            sup = @(n, k) struct('type', {s.type}, 'subs', {{n k} s.subs(2:end)});
            value = @(n, k) varargin{1}(n, k);
        end
    end
    for n = n_index
        for k = k_index
            obj = builtin('subsasgn', obj, sup(n, k), value(n, k));
        end
    end
else
    obj = builtin('subsasgn',obj,s, varargin{:});
end

end %------------------------------------------------------------

