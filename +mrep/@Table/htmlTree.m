function tree = htmlTree(obj)

tbadapt = html.TableAdaptor();
for n = 1:size(obj, 1)
    for k = 1:size(obj, 2)
        tag = htmlTree@mrep.Frame(obj(n, k));
        tbadapt.setBody([n, k], tag);
        obj(n, k).setParentStyle(tbadapt.getBody([n, k]));
    end
end

% add table labels
row_label = {};
for n = 1 : length(obj(1).row_label_)
    row_label{n} = obj(1).row_label_(n).htmlTree();
end 
% 
col_label = {};
for n = 1 : length(obj(1).col_label_)
    col_label{n} = obj(1).col_label_(n).htmlTree();
end 
if ~isempty(row_label)
    tbadapt.setRowLabels(row_label);
end
if ~isempty(col_label)
    tbadapt.setColLabels(col_label);
end
% 
% tb styles
td_item = tbadapt.rowLabels;
for n = 1 : length(obj(1).row_label_)
    obj(1).row_label_(n).setParentStyle(td_item(n));
end 
% 
td_item = tbadapt.colLabels;
for n = 1 : length(obj(1).col_label_)
    fr = obj(1).col_label_(n);
    fr.setParentStyle(td_item(n));
end 

tbadapt.table.class = 'table-skin-a table-compact';
tree = tbadapt.table;
end %------------------------------------------------------------

