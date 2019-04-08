function tree = htmlTree( obj )
filename = strrep(obj.filename_, '\', '\\');
filename = strrep(filename, '/', '\\');
img = ht.img().src(filename);
tree = img;

end %------------------------------------------------------------

