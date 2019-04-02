function labels = ColLabel( obj, index )
    labels = htag.empty();
    if obj.has_col_names_
        for n = index;
            if n > 0
                labels(end + 1) = obj.tbody.content_(1).content_(obj.colOrigin - 1 + index);
            else
                labels(end + 1) = obj.tbody.content_(1).content_(end + index + 1);
            end
        end
    end
end %------------------------------------------------------------

