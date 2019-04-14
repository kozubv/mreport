clc
clear
close all

root_folder = fullfile(fileparts(mfilename('fullpath')),'..', 'tested_reports');
rep = mrep.Report(root_folder, ...
    'name', 'my_report_x01', ...
    'flag_reset', true);

page1 = rep.Page('first-page.html');
page1.h1('first-page-title');

page2 = rep.Page('second-page.html');
page2.h1('second-page-title');

page3 = rep.Page('third-page.html');
page3.h1('third-page-title');


rep.h1('main title');
rep.text('text-content');
rep.sample('line<br>line<br>line<br>line<br>line<br>line<br>line<br>line<br>');

rep.h3('main title 3');
rep.h3('main title 4');

rep.Build();




