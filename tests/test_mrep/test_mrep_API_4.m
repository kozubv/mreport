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

tb = rep.table(4, 4);

img = tb(1, end).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_1.png');
img = tb(2, end).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_2.png');
img = tb(3, end).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_3.png');
img = tb(4, end).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_4.png');

rep.Build();




