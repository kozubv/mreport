function obj = setRowLabels( obj, labels )
obj.has_row_names_ = true;

for n = 1:obj.height
    obj.row(n).content_ = [ht.th() obj.row(n).content_];
end

label_origin = double(obj.has_col_names_);
for n = label_origin + 1:length(labels)
    if (isa(labels{n}, 'htag') || isa(labels{n}, 'char'))
        obj.row(n).content_(1).content_ = labels{n};
    else 
        error('label cell can be only "htag" or "char" class objekt');
    end
end

end %------------------------------------------------------------

