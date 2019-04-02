function tree = htmlTree(obj)

tbadapt = html.TableAdaptor();
for n = 1:size(obj, 1)
    for k = 1:size(obj, 2)
        tbadapt.setBody([n, k], obj.data(n, k).htmlTree());
    end
end
tbadapt.table.class = 'table-skin-a table-compact';
tree = tbadapt.table;
end %------------------------------------------------------------

