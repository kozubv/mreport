function item = h2(obj, varargin)
p = inputParser;
addOptional(p, 'content', '', @ischar);
parse(p, varargin{:});
par = p.Results;

item = mrep.Handle(2, par.content);
obj.pushback(item);

end %------------------------------------------------------------

