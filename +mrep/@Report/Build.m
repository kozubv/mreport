function err = Build(obj)
btn = related_pages(obj.pages_, [obj.name_ '.html']);
obj.header.content_ = [obj.header.content_ btn];

str = Build@mrep.Page(obj);
for n = 1:length(obj.pages_)
    str_page = obj.pages_(n).Build;
    str = [str char(10) str_page];
end
end %------------------------------------------------------------



function btn = related_pages(pages, home_link)
home = ht.a(ht.button('Home').type('button').class('btn btn-light')).href(home_link);
btn = ht.div().class('btn-group');
btn.content_(end + 1) = ht.a(ht.button('Releted Pages').type('button').class('btn btn-light')).href('related-pages.html');
btn.content_(end + 1) = ht.button(ht.span('toggle dropdown').class('sr-only')).class('btn btn-light dropdown-toggle dropdown-toggle-split');
tmp = btn.content_(end);
tmp.data_toggle('dropdown').aria_haspopup('true').aria_expended('false');
list = ht.div().class('dropdown-menu');
for n = 1:length(pages)
    page = pages(n);
    page.header.content_(end + 1) = home;
    list.content_(end + 1) = ht.a(page.title()).class('dropdown-item').href(page.name());
end
%list.content_(end + 1) = ht.div().class('dropdown-divider');
btn.content_(end + 1) = list;
btn = [home btn];
end %------------------------------------------------------------

% <!-- Example split danger button -->
% <div class="btn-group">
%   <button type="button" class="btn btn-danger">Action</button>
%   <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
%     <span class="sr-only">Toggle Dropdown</span>
%   </button>
%   <div class="dropdown-menu">
%     <a class="dropdown-item" href="#">Action</a>
%     <a class="dropdown-item" href="#">Another action</a>
%     <a class="dropdown-item" href="#">Something else here</a>
%     <div class="dropdown-divider"></div>
%     <a class="dropdown-item" href="#">Separated link</a>
%   </div>
% </div>