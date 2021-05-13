function [] = flatten_batch_grey(im_nr, order, scale)
mkdir(['image' num2str(im_nr) '/images/flatten' num2str(order) '_' num2str(scale) 'Hz_grey']);
i=1;
tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
        [ ~, ~, name] = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['A' num2str(i+1)]);
        load(['image' num2str(im_nr) '/data/data_' name{1,1} '.mat']);
        load(['image' num2str(im_nr) '/header/header_' name{1,1} '.mat']);
        [matrix] = flatten_new(data, header, order);
         save (['image' num2str(im_nr) '/images/flatten' num2str(order) '_' num2str(scale) 'Hz_grey' '/data_' name{1,1} '.mat'], 'matrix');  
         matrix_rescaled = 0.5 + matrix/scale;         
    imwrite(matrix_rescaled, ['image' num2str(im_nr) '/images/flatten' num2str(order) '_' num2str(scale) 'Hz_grey' '/' name{1,1} '.jpg'], 'jpg'); 
    end
    i = i+1;
     tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
end
end