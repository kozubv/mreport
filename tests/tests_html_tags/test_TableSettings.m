clc
clear
close all
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tb = html.TableAdaptor();
for n = 1:5
    tb.setBody([n, n], ['cell-----' num2str(n) '-' num2str(n)]);
end
tb.setBody([1, 5], '.   xxx   .');
tb.setRowLabels({'a' 'b' 'c' 'b' 'strong'})
tb.setColLabels({'a' 'b' 'c' 'b' 'strong'})
tb.table.class = 'table-skin-a table-normal table-hover';
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tb2 = html.TableAdaptor();
for n = 1:5
    for k = 1:5
        tb2.setBody([n, k], repmat(num2str(n+k), 1, 2));
    end
end
tb2.setBody([1, 5], '.   xxx     |        .');

tb2.setRowLabels({'a' 'b' 'c' 'b' 'strong'})
tb2.setColLabels({'a' 'b' 'c' 'b' 'strong'})
tb2.table.class = 'table-skin-a table-compact';
tb2.table.align='center';
%rows = tb2.rowLabels;
%cols = tb2.colLabels;
% arrayfun(@(item) item.class('vertical-text'), rows, 'UniformOutput',false);
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tb3 = html.TableAdaptor();
for n = 1:5
    for k = 1:5
        tb3.setBody([n, k], repmat(num2str(n+k), 1, 2));
    end
end
tb3.setBody([1, 5], '.   xxx     |        .');

tb3.setRowLabels({'a' 'b' 'c' 'b' 'strong'})
tb3.setColLabels({'a' 'b' 'c' 'b' 'strong'})
tb3.table.class = 'table-skin-a table-full';
tb3.table.align='center';
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

current_folder = fileparts(mfilename('fullpath'));
pg1 = html.Page(current_folder, 'test_table_settings.html');

pg1.main.content_(end + 1) = ht.h1('My CSS testing');
pg1.main.content_(end + 1) = ht.h2('table-normal');
pg1.main.content_(end + 1) = tb.table;

pg1.main.content_(end + 1) = ht.h2('table-compact').align('center');
pg1.main.content_(end + 1) = tb2.table;

pg1.main.content_(end + 1) = ht.h3('table-full').align('center');
pg1.main.content_(end + 1) = tb3.table;

str = pg1.Build();


