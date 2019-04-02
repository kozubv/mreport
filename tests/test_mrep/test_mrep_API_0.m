clc
clear
close all

root_folder = fullfile(fileparts(mfilename('fullpath')),'..', 'tested_reports');
rep = mrep.Report(root_folder, ...
                        'name', 'my_report_x01', ...
                        'flag_reset', true);
               
page1 = rep.Page('first-page.html');
page1.h1('first-page-title');

rep.h1('main title');
rep.text('text-content');


tb = rep.table(2, 3);
tb.data(:, 1) = 33;
tb.data(:, 2) = 22;
tb.data(:, 3) = 11;
tb33 = tb.data(1, 3).table(3, 3);
tb33.data(:, :) = 0;
tb33.data(1, 1) = 323;
tb2 = tb33.data(2, 2).table(4, 5);
tb2.data(:, :) = {'word'};

rep.Build();



