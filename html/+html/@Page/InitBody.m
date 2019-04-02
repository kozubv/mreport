function obj = InitBody( obj )

obj.header = ht.header();
obj.aside = ht.aside();
obj.main = ht.main();

obj.body = ht.body([
    obj.header
    obj.aside
    obj.main
]);

end

