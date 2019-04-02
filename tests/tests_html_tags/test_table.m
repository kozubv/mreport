clc
clear
close all

tr1 = ht.tr();
tr2 = ht.tr();
tr3 = ht.tr();
table = ht.table([tr1 tr2 tr3]).border('1');

tr1.content_ = [ht.td('1') ht.td('3') ht.td('3')]
tr2.content_ = [ht.td('1') ht.td('4') ht.td('3')]
tr3.content_ = [ht.td('1') ht.td('3') ht.td('3')]
table.print

str = table.printformat();
current_folder = fileparts(mfilename('fullpath'));
fid = fopen(fullfile(current_folder, 'table_test.html'), 'w');
fprintf(fid, str);
fclose(fid);

% htable = ht.table();
% htable.content_(end + 1) = ht.tr()