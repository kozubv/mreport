function obj = subsasgn(obj, s, value )

if strcmp(s(1).type, '.') ...
        && strcmp(s(1).subs, 'data') ...
        && strcmp(s(2).type, '()') ...
        && length(s(2).subs) == 2
    if numel(value) == 1
        if length(s) == 2
            % single value assing
            val_is_frame = isa(value, 'mrep.Frame');
            if s(2).subs{1}  == ':'
                nvector = 1:size(obj.data, 1);
            else
                nvector = s(2).subs{1};
            end
            if s(2).subs{2}  == ':'
                kvector = 1:size(obj.data, 2);
            else
                kvector = s(2).subs{2};
            end
            for n = nvector
                for k = kvector
                    if val_is_frame
                        % obj.data(n, k) = value;
                        obj = builtin('subsasgn', obj, ...
                            struct('type', {'.' '()'}, ...
                            'subs', {'data' {n k}}), value);
                    else
                        obj.data(n, k) = mrep.Frame;
                        % obj.data(n, k).value = value;
                        sup = struct('type', {'.' '()' '.'}, 'subs', {'data' {n k} 'var'});
                        obj = builtin('subsasgn', obj, sup, value);
                    end
                end
            end
        elseif length(s) == 3
            if s(2).subs{1}  == ':'
                nvector = 1:size(obj.data, 1);
            else
                nvector = s(2).subs{1};
            end
            if s(2).subs{2}  == ':'
                kvector = 1:size(obj.data, 2);
            else
                kvector = s(2).subs{2};
            end
            for n = nvector
                for k = kvector
                    obj = builtin('subsasgn', obj, ...
                        struct('type', {'.' '()' '.'}, ...
                        'subs', {'data' {n k} s(3).subs}), value);
                end
            end
        else
            obj = builtin('subsasgn', obj, s, value{:});
        end
    elseif size(value, 1) == length(s(2).subs{1}) ...
            && size(value, 2) == length(s(2).subs{2})
        % array value assign
        if s(2).subs{1}  == ':'
            nvector = 1:size(obj.data, 1);
        else
            nvector = s(2).subs{1};
        end
        if s(2).subs{2}  == ':'
            kvector = 1:size(obj.data, 2);
        else
            kvector = s(2).subs{2};
        end
        for n = nvector
            for k = kvector
                if isa(value, 'cell')
                    val_asgn = value{n, k};
                    val_is_frame = isa(val_asgn, 'mrep.Frame');
                elseif isa(value, 'double')
                    val_asgn = value(n, k);
                    val_is_frame = isa(val_asgn, 'mrep.Frame');
                else
                    error('only cell array or double array');
                end
                
                if val_is_frame
                    % obj.data(n, k) = value;
                    obj = builtin('subsasgn', obj, ...
                        struct('type', {'.' '()'}, ...
                        'subs', {{'data'} {n k}}), val_asgn);
                else
                    obj.data(n, k) = mrep.Frame;
                    % obj.data(n, k).value = value;
                    sup = struct('type', {'.' '()' '.'}, 'subs', {'data' {n k} 'var'});
                    obj = builtin('subsasgn', obj, sup, val_asgn);
                end
            end
        end
    else
        error('ssss');
    end
else
    obj = builtin('subsasgn',obj,s, value{:});
end

end %------------------------------------------------------------
