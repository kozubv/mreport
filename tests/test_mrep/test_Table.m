clc
clear
close all

tb = mrep.Table;
x = tb(2, 2);
x.h1('embedded-content-1');
x.h2('content-h2');
x.h3('content-h3');
x.text([...
'-----------------' char(10) ...
'==============' char(10)...
'+++++++++++']);
x.print();
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


f = tb(1, 1);
f.h1('embedded-content-1');
f.h2('content-h2');
f.h3('content-h3');
f.text([...
'some text, wich can conteain **markdown** sintax,<br>' char(10) ...
'[link](URL) to __headers__ and related pages ,<br>]' char(10)...
'![images](stored as file, or, printed from figure)']);
f.print();
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


tb(1, 2).h3('subtable');
tb(1, 2).text('///////////////');
tb(2, 1).h3('subtable');
tb21 = tb(2, 1).table();
tb21(2, 2).text(['============' char(10) '0000000000']);
tb21(1, 2).text(['============' char(10) '0000000000']);
tb21(2, 1).text(['============' char(10) '0000000000']);
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


str = tb.print()
current_folder = fileparts(mfilename('fullpath'));
fid = fopen(fullfile(current_folder, 'test_mrepTable.html'), 'w');
fprintf(fid, str);
fclose(fid);


