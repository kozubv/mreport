function td = col(obj, index)
validateattributes(index, {'numeric'},{'numel', 1, 'positive'});
td = htag.empty();
for n = 1:obj.haight
    td(end + 1) = obj.row(n).content_(index);
end
end %----------------------------------------------------

