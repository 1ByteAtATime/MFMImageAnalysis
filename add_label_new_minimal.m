function [] = add_label_new(Crop_or_not, Position_X, Position_Y, Add_temp_or_not, Add_field_or_not, fieldUnit,  Font_size, Text_color, Box_color,Box_opacity)
mkdir('labelled_images');
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
 a = [num2str(Add_temp_or_not) num2str(Add_field_or_not)];
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
         [~,~,temp]=xlsread('dataInfo.xlsx',['C' num2str(i+1) ':C' num2str(i+1)]);
         [~,~,field]=xlsread('dataInfo.xlsx',['D' num2str(i+1) ':D' num2str(i+1)]);
    switch a
        case '10'
            text = [num2str(temp{1,1}) ' K'];
        case '01'
            text =  [num2str(field{1,1}) ' ' fieldUnit];
        case '11'
            N = name{1};
            N = N(end-2:end);    
%                S = dlmread('scale.txt');
%              text = [num2str(temp{1,1}) ' K' '  ' num2str(field{1,1}) ' ' fieldUnit '  ' num2str(round(S(i,1),2)) ' Hz' '  ' N];
%               text = [num2str(field{1,1}) ' ' fieldUnit '  ' num2str(round(S(i,1),2)) ' Hz' ];
                text = [num2str(field{1,1}) ' ' fieldUnit];
%                 text = [num2str(temp{1,1}) ' K' '  ' num2str(field{1,1}) ' ' fieldUnit];
%                     text = [num2str(temp{1,1}) ' K'];
%                 text = [num2str(temp{1,1}) ' K' '  ' num2str(field{1,1}) ' ' fieldUnit '  ' N];
        otherwise
            text = [];
    end
    if Crop_or_not
         I = imread(['Crop_' name{1,1} '.jpg']);
    else I = imread([ num2str(name{1,1}) '.jpg']);
    end
    xy = size(I);
%     I_label = insertText(I, [xy(2)-256,xy(1)], text, 'AnchorPoint','CenterBottom', 'FontSize', Font_size,'TextColor', Text_color ,'BoxColor', Box_color, 'BoxOpacity', Box_opacity);
%     I_label = insertText(I, [xy(2),xy(1)], text, 'AnchorPoint','RightBottom', 'FontSize', Font_size,'TextColor', Text_color ,'BoxColor', Box_color, 'BoxOpacity', Box_opacity);
    I_label = insertText(I, [Position_X, Position_Y], text, 'FontSize', Font_size,'TextColor', Text_color ,'BoxColor', Box_color, 'BoxOpacity', Box_opacity);
    imwrite(I_label, default, ['labelled_images/labelled_' num2str(name{1,1}) '.bmp'], 'bmp');
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
end

    
