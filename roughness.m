function [] = roughness()
 listing = dir ('*crop*');
xlswrite('domain_contrast.xlsx',{'Name'}, 1, 'A1');
xlswrite('domain_contrast.xlsx',{'roughness_rms(Hz)'}, 1, 'C1');
 for i = 1:length(listing)
     name = listing(i).name;
     xlswrite(['domain_contrast.xlsx'],{name}, 1, ['A' num2str(i+1)]);
     I = imread(name);
     [scale, ~] = strread( name, '%s %s','delimiter', 'H');
     scale = flip(strtok(flip([scale{1,1}]), '_'));
    scale = str2double(scale);
    roughness = scale/255*std2(I);
    xlswrite('domain_contrast.xlsx',roughness, 1, ['C' num2str(i+1)]);
 end
end