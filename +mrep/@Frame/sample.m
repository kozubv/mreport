function item = sample(obj, varargin )
item = mrep.Sample(varargin{:});
obj.pushback(item);
end %------------------------------------------------------------

