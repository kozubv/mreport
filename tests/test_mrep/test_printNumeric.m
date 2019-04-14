clc
clear
close all


a = [100000 0.001; 1.001 2; 1 2]';
b = [1 1.0001 2.000]
str = mrep.lib.printNumeric(b);
% str = mrep.lib.printNumeric(a);
disp(str)
