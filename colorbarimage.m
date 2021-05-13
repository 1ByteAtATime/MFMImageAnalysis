function [] = colorbarimage(colormap, aspectRatio)
width = round(256*aspectRatio);
matrix = transpose(255:-1:0);
for i= 1:width-1
    matrix = [matrix transpose(255:-1:0)];  
end
imwrite(matrix, colormap , ['colorbar.jpg'], 'jpg');
% 
% imshow(matrix, colormap)
% c = colorbar;
% c.Limits = [-4 4];
% c.Ticks = [-4 0 4];
% c.TickLabels = {'-4 Hz','0 Hz','4 Hz'};
end

