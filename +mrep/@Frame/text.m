function item = text(obj, varargin)
p = inputParser;
addOptional(p, 'content', '', @ischar);
parse(p, varargin{:});
par = p.Results;

item = mrep.Text(par.content);
obj.pushback(item);

end %------------------------------------------------------------