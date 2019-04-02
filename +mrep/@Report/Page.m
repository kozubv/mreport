function page = Page(obj, name)
page = mrep.Page(obj.folder_related_pages_, name, obj);
obj.addPage(page);
end %------------------------------------------------------------

