function obj = ConstructFromTable( obj, table )
for n = 1 :size(table, 1) 
    for k = 1: size(table, 2)
       obj(n, k).var = table{n, k};
    end
end

row_names = table.Properties.RowNames;
for n = 1 :length(row_names)
    obj.rowLabel(n).var = row_names{n};
end

col_names = table.Properties.VariableNames;
for n = 1 : length(col_names)
    obj.colLabel(n).var = col_names{n};
end
end %------------------------------------------------------------

