function labels = RowLabel( obj, index )
    labels = htag.empty();
    if obj.has_row_names_
        for n = index
            if n > 0
                labels(end + 1) = obj.row(n).content_(1);
            else
                labels(end + 1) = obj.row(obj.height + n).content_(1);
            end
        end
    end
end %------------------------------------------------------------