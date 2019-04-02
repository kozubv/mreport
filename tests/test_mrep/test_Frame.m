clc
clear
close all

% f1 = mrep.impl.Frame;
% h1 = mrep.Handle(1, 'handle-content-1')
% h2 = mrep.Handle(2, 'handle-content-2')
% h1.print()
% f1.pushback(h1)
% f1.pushback(h2)
% f1.print()


f2 = mrep.impl.Frame;
h1 = f2.h1('embedded-content-1');
h2 = f2.h2('content-h2');
h3 = f2.h3('content-h3');

f2.print()
f2.text(['-----------------' char(10) ...
         '==============' char(10)...
         '+++++++++++']);
f2.print()


