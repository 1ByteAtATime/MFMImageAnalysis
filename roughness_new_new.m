function [] = roughness_new()
% xlswrite('roughness.xlsx',{'Name'}, 1, 'A1');
% xlswrite('roughness.xlsx',{'Field (T)'}, 1, 'B1');
% xlswrite('roughness.xlsx',{'Roughness_rms (Hz)'}, 1, 'C1');
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)
            if tag
                [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
                [~,~,field]=xlsread('dataInfo.xlsx',['D' num2str(i+1) ':D' num2str(i+1)]);
                load(['data_' name{1,1} '.mat']);
                roughness = std2(matrix);
                N(i+1,:) = i;
                F(i+1,:) = cell2mat(field);
                R(i+1,:) = cell2mat({roughness});
                A = [N F R];
                B = A(any(A,2),:);
%                 xlswrite('roughness.xlsx',name, 1, ['A' num2str(i+1)]);
%                 xlswrite('roughness.xlsx',field, 1, ['B' num2str(i+1)]);
%                 xlswrite('roughness.xlsx',roughness, 1, ['C' num2str(i+1)]);
            end
            i=i+1;
            tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
        dlmwrite('roughness.txt', B);
end
