function []=stretch_image()
% offset get from photoshop output, crop width from photoshop crop width
mkdir('stretch_images');
X = xlsread('dataInfo.xlsx','G:G');
Y = xlsread('dataInfo.xlsx','H:H');
X_offset = xlsread('dataInfo.xlsx','I:I');
Y_offset = xlsread('dataInfo.xlsx','J:J');
X_stretch = xlsread('dataInfo.xlsx','K:K');
Y_stretch = xlsread('dataInfo.xlsx','L:L');
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
        [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
        
        I = imread([num2str(name{1,1}) '.jpg']);
        
        [rows, columns] = size(I);
        newXWidthI = round(X_stretch(i,1) * rows);
        %         use if images are not square sizes
%         newXWidth = round(X_stretch(i,1) * columns);
        newYWidthI = round(Y_stretch(i,1) * rows);
        stretchedImage = imresize(I, [newXWidthI newYWidthI]);
        
        I_crop = imcrop(stretchedImage, [-X_offset(i,1) -Y_offset(i,1) X(i,1) Y(i,1)]);
        imwrite(I_crop, ['stretch_images/Crop_' num2str(name{1,1}) '.jpg'], 'jpg');
        
        
        load(['data_' num2str(name{1,1}) '.mat']);
        
        [rowsMatrix, columnsMatrix] = size(matrix);
        newXWidthMatrix = round(X_stretch(i,1) * rowsMatrix);
%       use if images are not square sizes
%       newXWidth = round(X_stretch(i,1) * columnsMatrix);
        newYWidthMatrix = round(Y_stretch(i,1) * rowsMatrix);
        stretchedMatrix = imresize(matrix, [newXWidthMatrix newYWidthMatrix]);
        matrix_crop = imcrop(stretchedMatrix, [-X_offset(i,1) -Y_offset(i,1) X(i,1) Y(i,1)]);
        save (['stretch_images/data_' num2str(name{1,1}) '.mat'], 'matrix_crop');  
    end
        i = i+1;
        tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end

end