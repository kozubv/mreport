function div = htmlTree( obj, parent_page )
if isempty(obj.content_)
    content = mrep.lib.VarCapture(obj.var);
else
    content = htag.empty();
    for n = 1:length(obj.content_)
        content(end + 1) = obj.content_{n}.htmlTree(parent_page);
    end
end
div = ht.div(content);

apply_class(obj, div);
end %------------------------------------------------------------


function obj = apply_class(obj, div)
if ~isempty(obj.class)
    div.class('+', obj.class);
end
end %------------------------------------------------------------
