function str = printvar(var, varargin)
p = inputParser;
addOptional(p, 'type', true);
addOptional(p, 'width', []);
addOptional(p, 'precision', []);
addOptional(p, 'colspace', []);
parse(p, varargin{:});
par = p.Results;

if isnumeric(var)
    str = printNumeric(var, par);
elseif islogical(var)
    
end


end %------------------------------------------------------------


function str = printNumeric(var, par)
if length(size(var)) > 2
    error('var dimentiona must be less then 3-D');
end
if numel(var) == 1
    str = num2str(var);
    return
end
if isfloat(var)
    varmax = max(max(abs(var)));
    varmin = min(min(abs(var)));
    vardif = varmax - varmin;
    if max(max(var)) == 0
        type = 'f';
        precision = '0';
    else
        diff_rank = floor(log10(vardif));
        max_rank = floor(log10(varmax));
        if max_rank > 3 || max_rank < -3
            type = 'e';
        else
            type = 'f';
        end
        precision = 4;
    end
    
    precision = num2str(precision);
    formspec = html.lib.strvar('%$(width).$(precision)$(type)', ...
        'width', '16', ...
        'precision', precision, 'type', type);
    str = num2str(var, formspec);
elseif isinteger(var)
    
end
end %------------------------------------------------------------


function rank = accuracy(num, ranklevel)
rm = abs(num);
rank = floor(log10(rm));
while rm > 0
    rm = rm - 10^rank;
    rank = floor(log10(rm));
    if rank > ranklevel
        break
    end
end
end %------------------------------------------------------------





