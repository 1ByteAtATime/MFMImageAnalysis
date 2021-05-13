
% X = [79,81,82,83,84,85,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105];
% Y = [78,79,81,82,83,84,85,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105];

X = [94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117];
Y = [93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117];

for i=1:length(X);

% A = importdata(['data_SROSTOCG017C_Part1',sprintf('%03d',X(i)),'.mat']);
% B = importdata(['data_SROSTOCG017C_Part1',sprintf('%03d',Y(i)),'.mat']);

A = importdata(['data_SROSTOCG026A',sprintf('%03d',X(i)),'.mat']);
B = importdata(['data_SROSTOCG026A',sprintf('%03d',Y(i)),'.mat']);


% A = importdata(['data_TmB4part20',num2str(i),'.mat']);
% A = importdata(['data_TmB4part2',sprintf('%03d',29),'.mat']);
% B = importdata(['data_TmB4part2',sprintf('%03d',46),'.mat']);
% C = importdata(['data_TmB4part2',sprintf('%03d',46),'.mat']);

% 
% Y1=(abs((min(min(A))))+abs(max(max(A))))/2;
% A1 = A+Y1;
% A1 = 256*A1/max(max(A1));
% 
% Y2=(abs((min(min(B))))+abs(max(max(B))))/2;
% B1 = B+Y2;
% B1 = 256*B1/max(max(B1));
% 
% Y3=(abs((min(min(C))))+abs(max(max(C))))/2;
% C1 = C+Y3;
% C1 = 256*C1/max(max(C1));

% if (size(A1)-size(B1))<1
% B2 = B1;
% A2 = padarray(A1, abs(size(A1)-size(B1)),'replicate','post');
% 
% else (size(A1)-size(B1))>1
% A2 = A1;
% B2 = padarray(B1,(size(A1)-size(B1)),'replicate','post');

if (size(A)-size(B))<1;
B2 = B;
A2 = padarray(A, abs(size(A)-size(B)),'replicate','post');

else (size(A)-size(B))>1;
A2 = A;
B2 = padarray(B,(size(A)-size(B)),'replicate','post');

end 

D=A2 - B2;
% D=D/.1;

roughness(i,1) = std2(D);

% imwrite(A1, default, ['A1','.jpg']);
% imwrite(B1, default, ['B1','.jpg']);
% imwrite(D, default, [num2str(i),'-',num2str(i-1),'.jpg']);
matrix_rescaled = (0.5 + D/(abs(max(D(:)))+abs(min(D(:)))))*256;
matrix_rescaled2 = (0.5 + D/.1)*256;
imwrite(matrix_rescaled2, cmocean('-dense'), [num2str(X(i)),'-',num2str(Y(i)),'.jpg']);


end
dlmwrite('roughnesssubtracts.txt', roughness);