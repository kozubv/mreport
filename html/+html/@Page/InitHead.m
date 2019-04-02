function obj = InitHead( obj )

obj.head = ht.head();
obj.head.content_ = [
    ht.meta().charset('utf-8');
    ht.meta().name('viewport').content('width=device-width, initial-scale=1, shrink-to-fit=no');
    ht.title(obj.title_);
     ht.link().rel('stylesheet').href(strrep('C:\Users\vad\Desktop\code\html\bootstrap-4.3.1-dist\bootstrap-4.3.1-dist\css\bootstrap.css', '\', '\\'));
     ht.link().rel('stylesheet').href(strrep('C:\Users\vad\Desktop\code\matlab\report_generator\html\+html\css\matlabHtml.css', '\', '\\'));
     ht.link().rel('stylesheet').href(strrep('C:\Users\vad\Desktop\code\matlab\report_generator\html\+html\css\page.css', '\', '\\'));
];
    
end

