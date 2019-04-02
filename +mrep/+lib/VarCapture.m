function str = VarCapture( var )
str = evalc('disp(var)');
if ~isempty(str)
    while str(end) == char(10)
        str(end) = [];
    end
end
end

