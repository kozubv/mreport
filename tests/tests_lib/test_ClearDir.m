clc
clear
close all

root_folder = fileparts(mfilename('fullpath'));
mkdir(fullfile(root_folder, 'test_for_clearing'));
mkdir(fullfile(root_folder, 'test_for_clearing', 'folder1'));
mkdir(fullfile(root_folder, 'test_for_clearing', 'folder2'));

fid1 = fopen(fullfile(root_folder, 'test_for_clearing', 'folder2', 'file1.txt'), 'w');
fid2 = fopen(fullfile(root_folder, 'test_for_clearing', 'folder2', 'file2.txt'), 'w');
fprintf(fid1, 'trash1');
fprintf(fid2, 'trash2');
fclose(fid1);
fclose(fid2);

fid1 = fopen(fullfile(root_folder, 'test_for_clearing', 'file1.txt'), 'w');
fid2 = fopen(fullfile(root_folder, 'test_for_clearing', 'file2.txt'), 'w');
fprintf(fid1, 'trash1');
fprintf(fid2, 'trash2');
%fclose(fid1);
%fclose(fid2);

fclose('all');
mrep.lib.ClearFolder(fullfile(root_folder, 'test_for_clearing'), 'r')
rmdir(fullfile(root_folder, 'test_for_clearing'))