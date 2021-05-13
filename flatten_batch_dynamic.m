function [] = flatten_batch_dynamic(im_nr, order)
mkdir(['image' num2str(im_nr) '/images/flatten' num2str(order)]);
i=1;
tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
        [ ~, ~, name] = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['A' num2str(i+1)]);
        load(['image' num2str(im_nr) '/data/data_' name{1,1} '.mat']);
        load(['image' num2str(im_nr) '/header/header_' name{1,1} '.mat']);
        if order==0
            matrix = data;
        else
        [matrix] = flatten_new(data, header, order);
        end
         save (['image' num2str(im_nr) '/images/flatten' num2str(order) '/data_' name{1,1} '.mat'], 'matrix');  
         %         scale(i,:) = abs(max(matrix(:)))+abs(min(matrix(:)));
% 1024x1024
%         scale(i,:) = abs(max(max(matrix(340:680, 340:680))))+abs(min(min(matrix(340:680, 340:680))));
% 512x512
%           scale(i,:) = abs(max(max(matrix(170:340, 170:340))))+abs(min(min(matrix(170:340, 170:340))));
% 512x512 offcenterright
          scale(i,:) = abs(max(max(matrix(294:482, 63:156))))+abs(min(min(matrix(294:482, 63:156))));          
        matrix_rescaled = (0.5 + matrix/scale(i,:))*256;
    imwrite(matrix_rescaled, cmocean('solar'), ['image' num2str(im_nr) '/images/flatten' num2str(order) '/' name{1,1} '.jpg'], 'jpg'); 
    dlmwrite(['image' num2str(im_nr) '/images/flatten' num2str(order) '/' 'scale.txt'], scale);
    end
    i = i+1;
     tag = xlsread(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],1, ['B' num2str(i+1)]);
end
end
