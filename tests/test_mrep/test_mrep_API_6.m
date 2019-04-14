clc
clear
close all

root_folder = fullfile(fileparts(mfilename('fullpath')),'..', 'tested_reports');
rep = mrep.Report(root_folder, ...
    'name', 'my_report_x01', ...
    'flag_reset', true);

page1 = rep.Page('first-page.html');
page1.h1('first-page-title');

tb = rep.table(3, 2);
f1 = figure(1);
x = 0:512;
text_content = ['By implementing operators that are appropriate' ...
                'for your class, you can integrate objects of your' ...
                'class into the MATLAB® language. For example, ' ...
                'objects that contain numeric data can define ' ...
                'arithmetic operations like +, *, - so that you' ...
                'can use these objects in arithmetic expressions. ' ...
                'By implementing relational operators, you can use' ...
                'objects in conditional statements, like switch and' ...
                'if statements.'];

for n = 1:3
    plot(x, sin(2*pi*x./(n*10)));
    drawnow
    tb(n, 1).text('a');
    %tb(n, 1).text(text_content);
    tb(n, 2).image(f1, ['sin_f_' num2str(n) '_px.png'], rep);
end

rep.h3('main title 3');
rep.h3('main title 4');

rep.Build();