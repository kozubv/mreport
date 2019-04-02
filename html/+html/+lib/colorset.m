function tag = colorset( marker )
color = marker(1:end-2);
sign = marker(end-1);
level = marker(end);
range = str2double([sign level]);
switch color
    case 'red'
        tag =  'hsl(0,100%,$(level)%)';
    case 'blue'
        tag = 'hsl(240,100%,$(level)%)';
    case 'green'
        tag = 'hsl(120,100%,$(level)%)';
    case 'gray'
        tag = 'hsl(0,0%,$(level)%)';
    otherwise
        tag = 'hsl(300,1000%,$(level)%)';
end
tag =  html.lib.strvar(tag, 'level', num2str(50 + range*10));
end %------------------------------------------------------------

