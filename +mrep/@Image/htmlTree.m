function tree = htmlTree( obj, parent_page )
filename = strrep(obj.filename_, '\', '\\');
filename = strrep(filename, '/', '\\');


% img = ht.img().src(filename).class('image-x11');
% caption = ht.div(obj.caption_).class('image-overlay-x11');
% tree = ht.div([img caption]).class('image-container-x11');
tree = ht.img().src(filename);
end %------------------------------------------------------------

