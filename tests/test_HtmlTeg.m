clc
clear
close all

b = htag.body;
h_1 = htag.h1('handle-content-1').color('red').size('12');
h_2 = htag.h1('handle-content-2');
t1 = ['paragraph-content' char(10) 'line-2-paragraph-content'];
t2 = htag.text('htag-text-1');
p = htag.p([t1 t2 htag.text('line-3-multiline') htag.h1(['handle-in-multi-line' char(10) 'line-2'])]);
b.content_ = [h_1 h_2 p]

b2 = htag.body;
h3 = htag.h1('handle-h3');
b2.content_ = [h3 b htag.h1('content-random-русский текст= привет')]

b2.print()
str = b2.printformat();

current_folder = fileparts(mfilename('fullpath'));
fid = fopen(fullfile(current_folder, 'htagprint.html'), 'w');
fprintf(fid, str);
fclose(fid);





