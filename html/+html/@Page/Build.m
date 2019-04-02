function str = Build( obj )
err = '';

pg1 = ht.html([obj.head obj.body]);

str = pg1.printformat();
str = strrep(str, '%', '%%');
fid = fopen(fullfile(obj.folder_, obj.name_), 'w');
fprintf(fid, [obj.WriteComment() char(10) str]);
fclose(fid);

end %------------------------------------------------------------

