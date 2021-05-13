function [] = loadAllFiles(im_nr)
% load all files in the current folder extracting the specific images.
% im_nr is the number of image extracted (first image is 0). Usually we use
% forward images. So for topo, im_nr =0 ; for amplitude, im_nr =2;for frequency, im_nr = 4. 
% Data matrices are saved in 'data' and header information are saved in
% 'header'. The data information are collected in excel file
% 'dataInfo.xlsx'.
dirListing = dir();
  mkdir(['image' num2str(im_nr)]);
  mkdir(['image' num2str(im_nr) '/header']);
  mkdir(['image' num2str(im_nr) '/data']);
  mkdir(['image' num2str(im_nr) '/images']);
  mkdir(['image' num2str(im_nr) '/excels']);
 xlswrite(['image' num2str(im_nr) '/excels/dataInfo.xlsx'],{'Name','Tag','Temperature','Field','Pixels','Scan direction', 'X','Y','X offset','Y offset','X Stretch','Y Stretch','Bias','Comment', }, 1 ,'A1');
 j=0;
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.sxm', ext)    % check whether the file is sxm file
            j=j+1;
            [header, data] = loadsxm(fileName, im_nr);
            if strcmp('up', header.scan_dir)
            data = flipud(data);
            end
            if mod(im_nr, 2)==1
                data = fliplr(data);
            end
            save   (['image' num2str(im_nr) '/header/header_' name '.mat'], 'header');
            save (['image' num2str(im_nr) '/data/data_' name '.mat'], 'data');  
            xlswrite(  ['image' num2str(im_nr) '/excels/dataInfo.xlsx'],{name, 0 , header.rec_temp,0, [num2str(header.scan_pixels(1,1)) 'X' num2str(header.scan_pixels(2,1))], header.scan_dir,0,0,0,0,1,1,header.bias,header.comment}, 1 ,['A' num2str(j+1)]);
        end           
    end
end
end