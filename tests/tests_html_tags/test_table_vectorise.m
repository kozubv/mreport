clc
clear
close all

tr1 = ht.tr();
tr2 = ht.tr();
tr3 = ht.tr();
table = ht.table([tr1 tr2 tr3]).border('1');

tr1.content_ = [ht.td('1') ht.td('4') ht.td('7')];
tr2.content_ = [ht.td('2') ht.td('5') ht.td('8')];
tr3.content_ = [ht.td('3') ht.td('6') ht.td('9')];
vect = table.content_;

table{3}{2}.id('index-1')
table{2}.id('index-2')

table{3}.find('index-1').border('10')
table.print

table('index-1')








