function content = htmlTree( obj )
if isempty(obj.content_)
    content = mrep.lib.VarCapture(obj.var);
    return
end

content = htag.empty();
for n = 1:length(obj.content_)
   content(end + 1) = obj.content_{n}.htmlTree(); 
end

end %------------------------------------------------------------

