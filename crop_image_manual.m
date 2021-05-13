function []=crop_image_manual(X,Y, Width,Height)
mkdir(['crop_images_' num2str(X) '_' num2str(Y) '_' num2str(Width) '_' num2str(Height)] );
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
         I = imread(['Crop_' name{1,1} '.jpg']);
     I_crop = imcrop(I, [X Y Width Height]);
    imwrite(I_crop, ['crop_images_' num2str(X) '_' num2str(Y) '_' num2str(Width) '_' num2str(Height) '/Crop_' name{1,1} '.jpg'], 'jpg');
     load(['data_' name{1,1} '.mat']);
     matrix = imcrop(matrix, [X Y Width Height]);
       save (['crop_images_' num2str(X) '_' num2str(Y) '_' num2str(Width) '_' num2str(Height) '/data_' name{1,1} '.mat'], 'matrix');  
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
end