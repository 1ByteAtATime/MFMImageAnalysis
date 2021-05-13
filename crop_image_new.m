function []=crop_image_new()
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
     I_crop = imcrop(imresize(I, [Y(i,1) X(i,1)]), [max(X_offset)-X_offset(i,1) max(Y_offset)-Y_offset(i,1) min(X+X_offset)-max(X_offset) min(Y+Y_offset)-max(Y_offset)]);
    imwrite(I_crop, ['crop_images/Crop_' num2str(name{1,1}) '.jpg'], 'jpg');
     load(['data_' num2str(name{1,1}) '.mat']);
     matrix = imcrop(imresize(matrix, [Y(i,1) X(i,1)]), [max(X_offset)-X_offset(i,1) max(Y_offset)-Y_offset(i,1) min(X+X_offset)-max(X_offset) min(Y+Y_offset)-max(Y_offset)]);
       save (['crop_images/data_' num2str(name{1,1}) '.mat'], 'matrix');  
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end

end