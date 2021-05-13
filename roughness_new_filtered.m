function [] = roughness_new_filtered()
 dirListing = dir ();
xlswrite('roughness_filtered.xlsx',{'Name'}, 1, 'A1');
xlswrite('roughness_filtered.xlsx',{'roughness_rms(Hz)'}, 1, 'B1');
j=0; 
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is mat file
            j= j+1;
             xlswrite('roughness_filtered.xlsx',{name}, 1, ['A' num2str(j+1)]);
             load(fileName);
             matrix(matrix > 4) = 0;
             fileName
             roughness = std2(matrix)
             xlswrite('roughness_filtered.xlsx',roughness, 1, ['B' num2str(j+1)]);
        end
    end
end
end