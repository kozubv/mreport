clc
clear
close all

tb = html.TableAdaptor();
for n = 1:5
    tb.setBody([n, n], ['cell-' num2str(n) '-' num2str(n)]);
end
tb.setRowLabels({'a' 'b' 'c' 'b' ht.strong('strong')})
tb.setColLabels({'a' 'b' 'c' 'b' ht.strong('strong')})
tb.table.padding = '0';
tb.table.margin = '0';

tb2 = html.TableAdaptor();
for n = 1:5
    tb2.setBody([n, n], tb.table);
end
tb2.setRowLabels({'a' 'b' 'c' 'b' ht.strong('strong')})
tb2.setColLabels({'a' 'b' 'c' 'b' ht.strong('strong')})
tb2.table.cellpadding = '0';

tb2.setBody([1 4], ht.p('line-1<br>line-2<br>line-3'));
tb2.ColLabel(1).content_ = ht.strong('first-col');
tb2.ColLabel(-1).content_ = ht.strong('last-col');

tb2.RowLabel(1).content_ = ht.strong('first-row');
tb2.RowLabel(-1).content_ = ht.strong('last-row');

tb2.namesCornerCell.content_ = html.TableAdaptor().setBody([5, 5], '').table.cellpadding('10');

tb2.table.print()
str = tb2.table.printformat();
current_folder = fileparts(mfilename('fullpath'));
fid = fopen(fullfile(current_folder, 'test_table_adaptor.html'), 'w');
fprintf(fid, str);
fclose(fid);







