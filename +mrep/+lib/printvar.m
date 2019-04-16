function str = printvar(var, varargin)
str = '';
if isnumeric(var)
    str = mrep.lib.printNumeric(var, varargin{:});
elseif ischar(var)
    str = var;
end


end %------------------------------------------------------------


