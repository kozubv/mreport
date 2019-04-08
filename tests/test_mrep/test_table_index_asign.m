clc
clear
close all

root_folder = fullfile(fileparts(mfilename('fullpath')),'..', 'tested_reports');
rep = mrep.Report(root_folder, ...
                        'name', 'my_report_x01', ...
                        'flag_reset', true);
               
% page1 = rep.Page('first-page.html');
% page1.h1('first-page-title');

rep.h1('main title');
rep.text('text-content');


tb = rep.table(2, 2); 
tb(:, 1:2) = rand(2, 2);

tb2 = mrep.Table(2, 2);
%tb(1, 2).table(2, 2);
tb(1, 2) = tb2;
tb(2, 2) = 10;
% tb(1, 2)
%tb.htmlTree().print()

disp('===================================')
rep.Build();


tb.htmlTree().print()




