clc
clear
close all
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tb = html.TableAdaptor();
for n = 1:5
    for k = 1:5
        tb.setBody([n, k], repmat(num2str(n+k), 1, 2));
    end
end
tb.setBody([1, 5], '.   xxx   .');
tb.setRowLabels({'a' 'b' 'c' 'b' 'strong'})
tb.setColLabels({'a' 'b' 'c' 'b' 'strong'})
tb.table.class = 'table-skin-b table-normal';
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tb.CellColor([1 1], html.lib.colorset('blue-4'));
tb.CellColor([1 2], html.lib.colorset('blue-3'));
tb.CellColor([1 3], html.lib.colorset('blue-2'));
tb.CellColor([1 4], html.lib.colorset('blue-1'));
tb.CellColor([1 5], html.lib.colorset('blue+0'));

tb.CellColor([2 1], html.lib.colorset('blue+1'));
tb.CellColor([2 2], html.lib.colorset('blue+2'));
tb.CellColor([2 3], html.lib.colorset('blue+3'));
tb.CellColor([2 4], html.lib.colorset('blue+4'));

% 
% tb.CellTextColor([3 1], 'red');
% tb.CellTextSize([3 2], 24);
% tb.CellTextStyle([3, 3], 'bold', 'italic');
% tb.CellTextAlign([3 5], 'right-bottom');

tb.CellBorderColor([4 2], 'blue').CellBorderWidth([4 2], 2);
tb.CellBorderWidth([4 4], [0 0 0 4]);

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
tb2 = html.TableAdaptor();
for n = 1:3
    for k = 1:3
        tb2.setBody([n, k], repmat(num2str(n+k), 1, 2));
    end
    tb2.setBody([n, n], tb.table);
end
tb2.setRowLabels({'a' 'b' 'c'})
tb2.setColLabels({'a' 'b' 'c'})
% tb2.CellColor([2 2], html.lib.colorset('red+4'));
tb2.table.class = 'table-skin-a table-container';
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

current_folder = fileparts(mfilename('fullpath'));
pg1 = html.Page(current_folder, 'test_cell_settings.html');

pg1.main.content_(end + 1) = ht.h1('Table cell settings');
pg1.main.content_(end + 1) = tb2.table;

str = pg1.Build();





