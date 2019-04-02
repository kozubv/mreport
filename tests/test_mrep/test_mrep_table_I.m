clc
clear
close all


tb = mrep.Table(2, 3)
tb.data(:, 2).var = 12;


f1 = tb.data(1, 2);
f1.h1('handle-content')