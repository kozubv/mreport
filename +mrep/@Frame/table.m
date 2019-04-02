function item = table(obj, varargin)
% p = inputParser;
% addOptional(p, 'content', '', @ischar);
% parse(p, varargin{:});
% par = p.Results;

item = mrep.Table(varargin{:});
obj.pushback(item);

end %------------------------------------------------------------