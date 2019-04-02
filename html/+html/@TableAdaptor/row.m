function r = row(obj, index)
validateattributes(index, {'numeric'},{'numel', 1, 'positive'});
if index > obj.height
    error('index exceeds')
end
r = obj.rows(index);
end %----------------------------------------------------