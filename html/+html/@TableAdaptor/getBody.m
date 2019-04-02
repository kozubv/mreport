function td = getBody(obj, index)
    validateattributes(index, {'numeric'},{'numel', 2, 'positive'});
    
    if index(1) == 0 && index(2) == 0
       td = obj.namesCornerCell;
       return
    end
    
    if index(1) == 0 && index(2) ~= 0
       td = obj.colLabels.content_(index(2));
       return
    end
    
    if index(1) ~= 0 && index(2) == 0
       td = obj.rowLabels.content_(index(1));
       return        
    end
    
    if index(1) > obj.height
        for  n = obj.height + 1 : index(1)
            obj.tbody.content_(end + 1) = ht.tr();
        end
    end
    
    for rw = obj.rows()
        for k = length(rw.content_) + 1 : index(2) + obj.colOrigin - 1
            rw.content_(end + 1) = ht.td();
        end
    end
    td = obj.row(index(1)).content_(index(2) + obj.colOrigin - 1);
end %----------------------------------------------------