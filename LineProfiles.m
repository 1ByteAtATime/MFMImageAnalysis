function [] = LineProfiles(Line1_X, Line1_Y, Line1_Size_X, Line1_Size_Y, Line2_X, Line2_Y, Line2_Size_X, Line2_Size_Y)
dirListing = dir();
j=0; 
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is mat file
            j= j+1;
             load(fileName);
             if Line1_Y+Line1_Size_Y > size(matrix,1) || Line1_X+Line1_Size_X > size(matrix,2) || Line2_Y+Line2_Size_Y > size(matrix,1) || Line2_Y+Line2_Size_Y > size(matrix,2)
                 continue
             end
             Line1 = matrix(Line1_Y : Line1_Y+Line1_Size_Y, Line1_X : Line1_X+Line1_Size_X);
             Line2 = matrix(Line2_Y : Line2_Y+Line2_Size_Y, Line2_X : Line2_X+Line2_Size_X);
        end     
        end 
end
end