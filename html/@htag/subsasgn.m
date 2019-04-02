function obj = subsasgn(obj, s, varargin)
% assign text fot element
if length(varargin) == 1 && strcmp(s(1).subs, 'content_') && ischar(varargin{1})
    varargin{1} = htag(varargin{1});
end

try 
    obj = builtin('subsasgn',obj,s,varargin{:});
    return;
    
catch ME
    
    if length(s) == 1 && strcmp(s(1).type, '.')
        obj.attributes_.(s(1).subs) = varargin{:};
    else
        rethrow(ME);
    end
end
end %------------------------------------------------------------