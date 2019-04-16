function filename = saveimage( plots_handle, varargin)
color = [0.9400    0.9400    0.9400];
if isa(plots_handle, 'matlab.graphics.axis.Axes')
    
elseif isa(plots_handle, 'matlab.ui.Figure')
    color = plots_handle.Color;
    plots_handle.Color = [1 1 1];
else
    error('matlab.graphics.axis.Axes OR matlab.ui.Figure');
end
if nargin == 3
    folder = varargin{1};
    [~, name, ext] = fileparts(varargin{2});
elseif nargin == 2
    [folder, name, ext] = fileparts(varargin{1});
    
end
if ~exist(folder, 'dir')
    error(['directory is not exist : ' folder]);
end

F = getframe(plots_handle);
plots_handle.Color = color;

filename = fullfile(folder, [name '.' ext]);
imwrite(F.cdata, filename);
end %------------------------------------------------------------

