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


tb = rep.table(4, 5);
tb(:, 1) = 33;
tb(:, 2) = 22;
tb(:, 3) = 11;
tb33 = tb(2, 3).table(3, 3);
tb33(:, :) = 0;
tb33(1, 1) = 323;
tb2 = tb33(2, 2).table(7, 8);
tb2(:, :) = 'word';
tb2.colLabel(1).text('sub-table-1');
tb2.colLabel(3).text('sub-table-2');
tb2.colLabel(4).var = 'var-frame';
tb2.rowLabel(1).text('sub-table-5');
tb2.rowLabel(3).text('sub-table-6');
tb.colLabel(1).text('try');
tb.colLabel(2).text('to');
tb.colLabel(3).text('set');
tb.colLabel(5).text('label');

tb.rowLabel(1).text('try');
tb.rowLabel(3).text('to');


rep.Build();



