function [] = colorbar(colormap, aspectRatio)
width = round(256*aspectRatio);
matrix = transpose(255:-1:0);
for i= 1:width-1
    matrix = [matrix transpose(255:-1:0)];  
end
imwrite(matrix, colormap , ['colorbar.jpg'], 'jpg');

cbh=colorbar('h');
set(cbh,'YTick',[-12:3:12])
end

