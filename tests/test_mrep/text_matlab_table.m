clc
clear
close all

% LastName2 = {'Sanchez';'Johnson';'Li';'Diaz';'Brown'};
% Age = [38;43;38;40;49];
% Smoker = logical([1;0;1;0;1]);
% Height = [71;69;64;67;64];
% Weight = [176;163;131;133;119];
% BloodPressure = {[124 93 1]; [109 77 2]; [125 83 3]; [117 75 4]; [122 80 34]};
% 
% T = table(LastName2,Age,Smoker,Height,Weight,BloodPressure)
% 
% 
% size(T)
% T{:, 7} = {'asd' 'asd' '===' '+++' 'rrr'}'

% current_folder = fileparts(mfilename('fullpath'));
% fid = fopen(fullfile(current_folder, 'matlab_table.txt'), 'w');
% fprintf(fid, evalc('disp(T)'));
% fclose(fid);


td = mrep.Frame()
td(2) = mrep.Frame()