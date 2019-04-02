function item = h1(obj, varargin)
p = inputParser;
addOptional(p, 'content', '', @ischar);
parse(p, varargin{:});
par = p.Results;

item = mrep.Handle(1, par.content);
obj.pushback(item);

end %------------------------------------------------------------

