clear all;
close all;
clc;

i=1; 
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
    while ~isempty(tag)  
    if tag>0
        
A = importdata(['data_TmB4part2',sprintf('%03d',i),'.mat']);
M(i) = sum(A(:));
field(i) = xlsread('dataInfo.xlsx',['D' num2str(i+1) ':D' num2str(i+1)]);
temp(i) = xlsread('dataInfo.xlsx',['C' num2str(i+1) ':C' num2str(i+1)]);

i = i+1
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)])
% figure;
% imagesc(A);
    else
 i = i+1
    tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
    
    end
    if i>41
        break
    end
    end
figure;
plot(temp, M, 'o');
figure;
plot(field, M, '-o');
X=[field',M'];
dlmwrite('M.txt',X); 

