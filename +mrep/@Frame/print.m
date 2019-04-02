function str = print(obj)
str = '';
len = length(obj.content_);
for n = 1:len
    str = horzcat(str, obj.content_{n}.print());
    if n ~= len
        str = horzcat(str, char(10));
    end
end

end

