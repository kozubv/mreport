clc
clear

x1 = 1;
x2 = 1:15;
x3 = rand(3, 5);
x4 = {x1 x2 x3 {'lol-main'}};
x5 = struct('field1', x4, 'field2', x3, 'field3', 'text-content')

s1 = mrep.lib.VarCapture(x1)
s2 = mrep.lib.VarCapture(x2)
s3 = mrep.lib.VarCapture(x3)
s4 = mrep.lib.VarCapture(x4)
s5 = mrep.lib.VarCapture(x5)

c1 = strrep(s1, char(10), '*')

v1 = ['<' s1 '>']
v2 = ['<' s2 '>']
v3 = ['<' s3 '>']
v4 = ['<' s4 '>']
v5 = ['<' s5 '>']

fid = fopen('VarCaptire.txt', 'w');
fprintf(fid, v2);
fclose(fid);