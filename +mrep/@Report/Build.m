function err = Build(obj)
str = Build@mrep.Page(obj);
for n = 1:length(obj.pages_)
   str_page = obj.pages_(n).Build;
   str = [str char(10) str_page];
end
end %------------------------------------------------------------

