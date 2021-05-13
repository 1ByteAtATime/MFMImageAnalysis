function [] = roughness_new()
 dirListing = dir ();
xlswrite('roughness.xlsx',{'Name'}, 1, 'A1');
xlswrite('roughness.xlsx',{'roughness_rms(Hz)'}, 1, 'B1');
j=0; 
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is mat file
            j= j+1;
             xlswrite('roughness.xlsx',{name}, 1, ['A' num2str(j+1)]);
             load(fileName);
             roughness = std2(matrix);
             xlswrite('roughness.xlsx',roughness, 1, ['B' num2str(j+1)]);
        end
    end
end
end