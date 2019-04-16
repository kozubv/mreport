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

LastName = {'Sanchez';'Johnson';'Li';'Diaz';'Brown'};
Age = [38; 43; 38; 40; 49];
Smoker = logical([1;0;1;0;1]);
Height = [71;69;64;67;64];
Weight = [176;163;131;133;119];
BloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];

T = table(LastName,Age,Smoker,Height,Weight,BloodPressure)

tb = rep.table(4, 4);

tb(1, end).h3('title-1');
ttb1 = tb(1, end).table(T);
tb(1, end).textAlign = 'top';

tb(2, end).h3('title-2');
ttb2 = tb(2, end).table(T);
tb(2, end).textAlign = 'bottom';

tb(3, end).h3('title-3');
ttb3 = tb(3, end).table(T);
tb(3, end).textAlign = 'top';

tb(4, end).h3('title-4');
ttb4 = tb(4, end).table(T);
tb(4, end).textAlign = 'top';

p = [ ...
'=========================' char(10) ...
'=========================' char(10) ...    
'=========================' char(10) ...
'=========================' char(10)
];

tb(1, 1).text(p);
tb(2, 1).text(p);
tb(3, 1).text(p);
tb(4, 1).text(p);

img = tb(1, 2).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_1.png');
img = tb(2, 2).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_2.png');
img = tb(3, 2).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_3.png');
img = tb(4, 2).image('C:\Users\vad\Desktop\code\matlab\report_generator\tests\tested_reports\image\mrep_test_4.png');


rep.Build();



