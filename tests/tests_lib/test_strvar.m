clc
clear
close all

import html.*
L = import

tmp = 'templete with $(param1), and $(param2)';
res = html.lib.strvar(tmp, ...
                      'param1', 'param1-value', ...
                      'param2', 'param2-value');
res

tmp = 'templete with \n$(32, c, param1),$(\n)and$(\n)$(32, c, param2)';
res = lib.strvar(lib.strnewline(tmp), ...
                      'param1', 'param1-value', ...
                      'param2', 'param2-value');
res

