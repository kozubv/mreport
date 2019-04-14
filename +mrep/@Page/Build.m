function str = Build(obj)

nav = Anchors(obj, '');
obj.aside.content_ = nav;

content = obj.htmlTree();
for n = 1:length(content)
    obj.main.content_(end + 1) = content(n);
end
str = Build@html.Page(obj);
end %------------------------------------------------------------


function list = Anchors(frame, padding)
list = htag.empty();
for n = 1:length(frame.content_)
    if isa(frame.content_{n}, 'mrep.Handle')
        a =  ht.a([padding frame.content_{n}.content]);
        a.href(['#' frame.content_{n}.anchor_id]);
        list(end + 1) = a;
    end
end
end %------------------------------------------------------------


