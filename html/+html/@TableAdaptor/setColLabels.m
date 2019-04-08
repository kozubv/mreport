function obj = setColLabels( obj, labels )
obj.has_col_names_ = true;

col_label_tr = ht.tr();
if obj.has_row_names_
    col_label_tr.content_ = obj.namesCornerCell;
end

for n = 1:length(labels)
    col_label_tr.content_(end + 1) = ht.th(labels{n});
end
obj.tbody.content_ = [col_label_tr obj.tbody.content_];
end %------------------------------------------------------------