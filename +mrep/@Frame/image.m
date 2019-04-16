function item = image(obj, plots_handle, image_name, folder)
% folder - relative path name, or html.Report handle
%

if nargin == 2 && ischar(plots_handle)
    item = mrep.Image(plots_handle);
else
    [parth, name, ext] = fileparts(image_name);
    if ~isempty(parth)
        error(['file parth must be empty. folder will be store in : ' obj.report_.folder_images_]);
    end
    item = mrep.Image(plots_handle, [name '.' ext], folder); 
end
    obj.pushback(item);
end %------------------------------------------------------------

