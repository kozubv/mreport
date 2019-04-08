function item = image( obj, varargin )

item = mrep.Image(varargin{:});
obj.pushback(item);

end %------------------------------------------------------------

