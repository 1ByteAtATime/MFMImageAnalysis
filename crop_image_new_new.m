function []=crop_image_new_new()
% In photoshop, just offset then crop, then read crop WH and offsets to
% excel
% add offset to excel doc (offset - crop offset, e.g. -10 px - (512-400 px))
mkdir('crop_images');
X = xlsread('dataInfo.xlsx','G:G');
Y = xlsread('dataInfo.xlsx','H:H');
X_offset = xlsread('dataInfo.xlsx','I:I');
Y_offset = xlsread('dataInfo.xlsx','J:J');
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
         I = imread([num2str(name{1,1}) '.jpg']);
     I_crop = imcrop(I, [-X_offset(i,1) -Y_offset(i,1) X(i,1) Y(i,1)]);
    imwrite(I_crop, ['crop_images/Crop_' num2str(name{1,1}) '.jpg'], 'jpg');
     load(['data_' num2str(name{1,1}) '.mat']);
     matrix = imcrop(matrix, [-X_offset(i,1) -Y_offset(i,1) X(i,1) Y(i,1)]);
       save (['crop_images/data_' num2str(name{1,1}) '.mat'], 'matrix');  
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end

end