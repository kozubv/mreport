function item = h3(obj, varargin)
p = inputParser;
addOptional(p, 'content', '', @ischar);
parse(p, varargin{:});
par = p.Results;

item = mrep.Handle(3, par.content);
obj.pushback(item);

end %------------------------------------------------------------