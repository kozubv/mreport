clc
clear
close all

h1 = mrep.Handle(1, 'handle-content');
h1.print()


txt = ['line1-line1-line1-line1-line1-line1-' char(10) ...
        'line2-line2-line2-line2-line2-line2'];
t1 = mrep.Text(txt).print()