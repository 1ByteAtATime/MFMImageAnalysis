function [] = planefit_batch_earthandgreen(im_nr, x_order, y_order, scale)
mkdir(['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_earth']);
i=1;
tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
        [ ~, ~, name] = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['A' num2str(i+1)]);
        load(['image' num2str(im_nr) '/data/data_' name{1,1} '.mat']);
        load(['image' num2str(im_nr) '/header/header_' name{1,1} '.mat']);
       [matrix] = planefit_new(data, header, x_order, y_order);
         save (['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_earth' '/data_' name{1,1} '.mat'], 'matrix');  
         matrix_rescaled = (0.5 + matrix/scale)*256-1;      
    imwrite(matrix_rescaled,earthandgreen, ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_earth' '/' name{1,1} '.jpg'], 'jpg'); 
    end
    i = i+1;
     tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
end
end
