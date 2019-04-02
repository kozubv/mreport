function str = strnewline(str)
str = strrep(str, '$(\n)', char(10));
str = strrep(str, '\n', char(10));
end %------------------------------------------------------------

