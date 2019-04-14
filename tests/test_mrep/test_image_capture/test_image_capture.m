clc
clear 
close all

f1 = figure(1);
plot(rand(5))

f2 = figure(2);

F = getframe(f1);

figure(3)
imshow(F.cdata)


current_folder = fileparts(mfilename('fullpath'));

imwrite(F.cdata, fullfile(current_folder, 'frame_image.png'))