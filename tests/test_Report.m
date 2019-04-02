clc
clear all
close all

root_folder = fullfile(fileparts(mfilename('fullpath')), 'tested_reports');
rep = mrep.Report(root_folder, ...
                    'name', 'my_report_x01', ...
                    'flag_reset', true)
               
