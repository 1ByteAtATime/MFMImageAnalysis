function [] = planefit_batch_default(crop_or_not, X,Y, Width,Height, im_nr, x_order, y_order, scale)
mkdir(['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default']);
i=1;
tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
        [ ~, ~, name] = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['A' num2str(i+1)]);
        load(['image' num2str(im_nr) '/data/data_' name{1,1} '.mat']);
        load(['image' num2str(im_nr) '/header/header_' name{1,1} '.mat']);
        if crop_or_not
             data = imcrop(data, [X Y Width Height]);
        end
        [matrix] = planefit_new(data, header, x_order, y_order);
        save (['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/data_' name{1,1} '.mat'], 'matrix');  
        matrix_rescaled = (0.5 + matrix/scale)*256;
%          imwrite(matrix_rescaled, jet, ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/' name{1,1} '.jpg'], 'jpg');
%         imwrite(matrix_rescaled, cmocean('-dense'), ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/' name{1,1} '.jpg'], 'jpg');
%         imwrite(matrix_rescaled, cmocean('-deep'), ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/' name{1,1} '.jpg'], 'jpg');
       imwrite(matrix_rescaled, cmocean('solar'), ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/' name{1,1} '.jpg'], 'jpg');
%        imwrite(matrix_rescaled, cmocean('ice'), ['image' num2str(im_nr) '/images/planefit' num2str(x_order) num2str(y_order) '_' num2str(scale) 'Hz_default' '/' name{1,1} '.jpg'], 'jpg');
    end
    i = i+1;
    tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
end
end
