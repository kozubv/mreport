clc
clear
close all

str = '<title>My Title</title><p>Here is some text.</p>';
expression = '<(\w+).*>.*</\1>';
[tokens,matches] = regexp(str,expression,'tokens','match')


str = '<pre attr="23">\t\t\tMy Title</pre><p>Here is some text.</p>';
% expression = '<pre .*>.*\\t+(?=.*</pre>';
expression = '(?<=<pre .*>.*)\\t+(?=.*</pre>)';
res = regexprep(str, expression, '')