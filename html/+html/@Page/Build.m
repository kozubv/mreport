function str = Build( obj )
err = '';

obj.header.class('+', 'navbar navbar-expand navbar-light bg-light');
brand = ht.div(ht.ul(ht.li(ht.strong('mreport')).class('nav-item')).class('navbar-nav')).class('navbar');
obj.header.content_ = [brand obj.header.content_];

obj.aside.class('+', 'sidenav-full-height');
obj.main.class('+', 'main-full-height');

pg1 = ht.html([obj.head obj.body]);

str = pg1.printformat();
str = strrep(str, '%', '%%');
fid = fopen(fullfile(obj.folder_, obj.name_), 'w');
fprintf(fid, [obj.WriteComment() char(10) str]);
fclose(fid);

end %------------------------------------------------------------


% <a class="navbar-brand" href="#">Navbar</a>