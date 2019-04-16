function str = printNumeric(var, varargin)
p = inputParser;
addOptional(p, 'width', []);
addOptional(p, 'precision', 4);
addOptional(p, 'format', '', @ischar);
addOptional(p, 'endZeros', false);
addOptional(p, 'colSplit', '  ', @ischar);
addOptional(p, 'showPoint', true);
addOptional(p, 'sameColFormat', false);
addOptional(p, 'intpoint', false);
addOptional(p, 'colnames', {},  @iscell)
parse(p, varargin{:});
par = p.Results;

if length(size(var)) > 2
    error('var dimentiona must be less then 3-D');
end

if par.sameColFormat
    str = printSameColFormat(var, par);
else
    str = printDiffColFormat(var, par);
end
str(:, end +1) = char(10);
str = reshape(str', 1, numel(str));
end %------------------------------------------------------------


function str = printDiffColFormat(var, par)
str = [];
colnum = size(var, 2);
rownum = size(var, 1);
namesnum = length(par.colnames);
name = [];
for n = 1:colnum
    colstr = printSameColFormat(var(:, n), par);
    if isempty(par.colnames)
        str = [str colstr repmat('  ', rownum, 1)];
    else
        if n <= namesnum
            namelen = length(par.colnames{n});
            collen = size(colstr, 2);
            len = max(collen + 2, namelen + 2);
            sep = repmat(' ', rownum, len - collen);
            colstr = [colstr sep];
            name_tmp = sprintf(['%-' num2str(size(colstr, 2)) 's'], par.colnames{n});
        else
            name_tmp = sprintf(['%-' num2str(size(colstr, 2)) 's'], '-');
        end
        name = [name name_tmp];
        str = [str colstr];
    end
end
str = [name; str];
end %------------------------------------------------------------


function str = printSameColFormat(var, par)
var_max = max(max(var));
var_min = min(min(var));
max_rn = floor(log10(var_max));
min_rn = floor(log10(var_min));
lim = 6;
if isempty(par.format)
    if max_rn - min_rn > lim || max_rn > lim || max_rn < -lim
        par.format = 'e';
    else
        par.format = 'f';
    end
end
if isempty(par.width)
    par.width = 2 + max(1, max_rn) + par.precision;
end
if par.format == 'f'
    align = '';
else
    align = '-';
end
if ~par.intpoint && max(max(var - fix(var))) < 1e-10
    par.precision = 0;
end
formatSpec = ['%' align num2str(par.width) '.' num2str(par.precision) par.format];
str = num2str(var, formatSpec);

if iscolumn(var) && par.precision > 0
    if par.format == 'f'
        while all(str(:, end) ~= '.')
            if all(str(:, end) == '0')
                str(:, end) = [];
            else
                break
            end
        end
        if all(str(:, end) == '.')
            if par.showPoint
                str(:, end + 1) = '0';
            else
                str(:, end) = [];
            end
        end
    elseif par.format == 'e'
        base = str(:, 1:par.precision + 2);
        tail = str(:, par.precision + 3:end);
        while all(base(:, end) ~= '.')
            if all(base(:, end) == '0')
                base(:, end) = [];
            else
                break
            end
        end
        if all(base(:, end) == '.')
            if par.showPoint
                base(:, end + 1) = '0';
            else
                base(:, end) = [];
            end
        end
        str = [base  tail];
    end
end

end %------------------------------------------------------------










