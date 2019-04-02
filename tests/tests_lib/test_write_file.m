clc
clear
close all


current_folder = fileparts(mfilename('fullpath'));
filename = fullfile(current_folder, 'text1.txt');

str = '<p>I will display &#9602;</p>\n';

fid = fopen(filename, 'w');
fprintf(fid, str);
fclose(fid);
