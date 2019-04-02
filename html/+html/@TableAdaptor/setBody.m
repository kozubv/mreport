function obj = setBody(obj, index, content)
    validateattributes(index, {'numeric'},{'numel', 2, 'positive'});
    obj.getBody(index).content_ = content;
end %----------------------------------------------------   