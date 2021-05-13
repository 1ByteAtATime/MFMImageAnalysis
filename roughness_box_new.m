function [] = roughness_box_new(X, Y, Size_X, Size_Y)
 dirListing = dir ();
xlswrite('roughness_box.xlsx',{'Name'}, 1, 'A1');
xlswrite('roughness_box.xlsx',{'roughness_rms(Hz)'}, 1, 'B1');
xlswrite('roughness_box.xlsx',{['Box:' num2str(X) ',' num2str(Y) ',' num2str(Size_X) ',' num2str(Size_Y)]}, 1, 'D1');
j=0; 
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is jpg file
            j= j+1;
             xlswrite('roughness_box.xlsx',{name}, 1, ['A' num2str(j+1)]);
             load(fileName);
              I_box = matrix(Y:Y+Size_Y ,X: X+Size_X);
             roughness = std2(I_box);
             xlswrite('roughness_box.xlsx',roughness, 1, ['B' num2str(j+1)]);
        end
    end
end
end