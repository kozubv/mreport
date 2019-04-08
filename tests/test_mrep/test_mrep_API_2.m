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


tb = rep.table(3, 4);
tb(:, :) = rand(3, 4);
tb(:, 1) = 33;
tb(:, 1).textSize = 16;
tb(:, 1).backColor = html.lib.colorset('red+3');

tb(:, 2) = 22;
tb(:, 2).textSize = 16;
tb(:, 2).backColor = html.lib.colorset('green+3');

tb(:, 4) = {[1 2 3]};
tb(:, 4).backColor = html.lib.colorset('blue+3');
tb(:, 4).textSize = 16;

tb(:, 3).textAlign = 'center';
tb(:, 3).borderWidth = {[1 5 1 1]};
tb(:, 3).borderColor = 'black';
tb(:, 3).textSize = 16;
%tb(:, 3).borderWidth = 5;

tb.rowLabel(2).var = 'row-label-1';
tb.colLabel(2).var = 'col-text-1';
tb.colLabel(1).var = 'col-text-3';
tb.colLabel(4).var = 'col-text-3';
tb.rowLabel(3).var = 'col-text-3';

tb2 = tb(2, 2).table(2, 2);
tb2(:, 2) = 10;
tb2(:, :).textSize = 16;

tb2.rowLabel(2).var = 'A';
tb2.colLabel(2).var = 'B';
tb2.colLabel(1).var = '1';

rep.Build();



