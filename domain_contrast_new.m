function [] = domain_contrast_new(Box_X1,Box_Y1,Box_Size_X1, Box_Size_Y1, ...
Box_X2,Box_Y2,Box_Size_X2, Box_Size_Y2, ...
Box_X3,Box_Y3,Box_Size_X3, Box_Size_Y3, ...
Box_X4,Box_Y4,Box_Size_X4, Box_Size_Y4, ...
Box_X5,Box_Y5,Box_Size_X5, Box_Size_Y5,...
Box_X6,Box_Y6,Box_Size_X6, Box_Size_Y6,...
Box_X7,Box_Y7,Box_Size_X7, Box_Size_Y7,...
Box_X8,Box_Y8,Box_Size_X8, Box_Size_Y8,...
Box_X9,Box_Y9,Box_Size_X9, Box_Size_Y9,...
Box_X10,Box_Y10,Box_Size_X10, Box_Size_Y10)
dirListing = dir();

xlswrite('domain_contrast.xlsx',{'Name'}, 1, 'A1');
xlswrite('domain_contrast.xlsx',{'Temp(K)'}, 1, 'B1');
xlswrite('domain_contrast.xlsx',{'Field(T)'}, 1, 'C1');

xlswrite('domain_contrast.xlsx',{'Box1(Hz)'}, 1, 'D1');
xlswrite('domain_contrast.xlsx',{'Box2(Hz)'}, 1, 'E1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_2-1(Hz)'}, 1, 'F1');
xlswrite('domain_contrast.xlsx',{'Box3(Hz)'}, 1, 'G1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_3-2(Hz)'}, 1, 'H1');
xlswrite('domain_contrast.xlsx',{'Box4(Hz)'}, 1, 'I1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_4-3(Hz)'}, 1, 'J1');
xlswrite('domain_contrast.xlsx',{'Box5(Hz)'}, 1, 'K1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_5-4(Hz)'}, 1, 'L1');
xlswrite('domain_contrast.xlsx',{'Box6(Hz)'}, 1, 'M1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_6-5(Hz)'}, 1, 'N1');
xlswrite('domain_contrast.xlsx',{'Box7(Hz)'}, 1, 'O1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_7-6(Hz)'}, 1, 'P1');
xlswrite('domain_contrast.xlsx',{'Box8(Hz)'}, 1, 'Q1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_8-7(Hz)'}, 1, 'R1');
xlswrite('domain_contrast.xlsx',{'Box9(Hz)'}, 1, 'S1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_9-8(Hz)'}, 1, 'T1');
xlswrite('domain_contrast.xlsx',{'Box10(Hz)'}, 1, 'U1');
xlswrite('domain_contrast.xlsx',{'domain_contrast_10-9(Hz)'}, 1, 'V1');

xlswrite('domain_contrast.xlsx',{'RMS1(Hz)'}, 1, 'W1');
xlswrite('domain_contrast.xlsx',{'RMS2(Hz)'}, 1, 'X1');
xlswrite('domain_contrast.xlsx',{'RMS3(Hz)'}, 1, 'Y1');
xlswrite('domain_contrast.xlsx',{'RMS4(Hz)'}, 1, 'Z1');
xlswrite('domain_contrast.xlsx',{'RMS5(Hz)'}, 1, 'AA1');
xlswrite('domain_contrast.xlsx',{'RMS6(Hz)'}, 1, 'AB1');
xlswrite('domain_contrast.xlsx',{'RMS7(Hz)'}, 1, 'AC1');
xlswrite('domain_contrast.xlsx',{'RMS8(Hz)'}, 1, 'AD1');
xlswrite('domain_contrast.xlsx',{'RMS9(Hz)'}, 1, 'AE1');
xlswrite('domain_contrast.xlsx',{'RMS10(Hz)'}, 1, 'AF1');

xlswrite('domain_contrast.xlsx',{['Box1:' num2str(Box_X1) ',' num2str(Box_Y1) ',' num2str(Box_Size_X1) ',' num2str(Box_Size_Y1)]}, 1, 'AG1');
xlswrite('domain_contrast.xlsx',{['Box2:' num2str(Box_X2) ',' num2str(Box_Y2) ',' num2str(Box_Size_X2) ',' num2str(Box_Size_Y2)]}, 1, 'AG2');
xlswrite('domain_contrast.xlsx',{['Box3:' num2str(Box_X3) ',' num2str(Box_Y3) ',' num2str(Box_Size_X3) ',' num2str(Box_Size_Y3)]}, 1, 'AG3');
xlswrite('domain_contrast.xlsx',{['Box4:' num2str(Box_X4) ',' num2str(Box_Y4) ',' num2str(Box_Size_X4) ',' num2str(Box_Size_Y4)]}, 1, 'AG4');
xlswrite('domain_contrast.xlsx',{['Box5:' num2str(Box_X5) ',' num2str(Box_Y5) ',' num2str(Box_Size_X5) ',' num2str(Box_Size_Y5)]}, 1, 'AG5');
xlswrite('domain_contrast.xlsx',{['Box6:' num2str(Box_X6) ',' num2str(Box_Y6) ',' num2str(Box_Size_X6) ',' num2str(Box_Size_Y6)]}, 1, 'AG6');
xlswrite('domain_contrast.xlsx',{['Box7:' num2str(Box_X7) ',' num2str(Box_Y7) ',' num2str(Box_Size_X7) ',' num2str(Box_Size_Y7)]}, 1, 'AG7');
xlswrite('domain_contrast.xlsx',{['Box8:' num2str(Box_X8) ',' num2str(Box_Y8) ',' num2str(Box_Size_X8) ',' num2str(Box_Size_Y8)]}, 1, 'AG8');
xlswrite('domain_contrast.xlsx',{['Box9:' num2str(Box_X9) ',' num2str(Box_Y9) ',' num2str(Box_Size_X9) ',' num2str(Box_Size_Y9)]}, 1, 'AG9');
xlswrite('domain_contrast.xlsx',{['Box10:' num2str(Box_X10) ',' num2str(Box_Y10) ',' num2str(Box_Size_X10) ',' num2str(Box_Size_Y10)]}, 1, 'AG10');

j=0;
k=0;

Box_X = [Box_X1, Box_X2, Box_X3, Box_X4, Box_X5, Box_X6, Box_X7, Box_X8, Box_X9, Box_X10];
Box_Y = [Box_Y1, Box_Y2, Box_Y3, Box_Y4, Box_Y5, Box_Y6, Box_Y7, Box_Y8, Box_Y9, Box_Y10];
Box_Size_X = [Box_Size_X1, Box_Size_X2, Box_Size_X3, Box_Size_X4, Box_Size_X5, Box_Size_X6, Box_Size_X7, Box_Size_X8, Box_Size_X9, Box_Size_X10];
Box_Size_Y = [Box_Size_Y1, Box_Size_Y2, Box_Size_Y3, Box_Size_Y4, Box_Size_Y5, Box_Size_Y6, Box_Size_Y7, Box_Size_Y8, Box_Size_Y9, Box_Size_Y10];
    
for i = 1: length(dirListing)
    i
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is mat file
            j= j+1;
             xlswrite('domain_contrast.xlsx',{name}, 1, ['A' num2str(j+1)]);
             load(fileName);
             
%              if Box_Y1+Box_Size_Y1 > size(matrix,1) || Box_X1+Box_Size_X1 > size(matrix,2) || ...
%                  Box_Y2+Box_Size_Y2 > size(matrix,1) || Box_X2+Box_Size_X2 > size(matrix,2) ||...
%                  Box_Y3+Box_Size_Y3 > size(matrix,1) || Box_X3+Box_Size_X3 > size(matrix,2) ||...
%                  Box_Y4+Box_Size_Y4 > size(matrix,1) || Box_X4+Box_Size_X4 > size(matrix,2) ||...
%                  Box_Y5+Box_Size_Y5 > size(matrix,1) || Box_X5+Box_Size_X5 > size(matrix,2) ||...
%                  Box_Y6+Box_Size_Y6 > size(matrix,1) || Box_X6+Box_Size_X6 > size(matrix,2) ||...
%                  Box_Y7+Box_Size_Y7 > size(matrix,1) || Box_X7+Box_Size_X7 > size(matrix,2) ||...
%                  Box_Y8+Box_Size_Y8 > size(matrix,1) || Box_X8+Box_Size_X8 > size(matrix,2) ||...
%                  Box_Y9+Box_Size_Y9 > size(matrix,1) || Box_X9+Box_Size_X9 > size(matrix,2) ||...
%                  Box_Y10+Box_Size_Y10> size(matrix,1) ||
%                  Box_X10+Box_Size_X10 > size(matrix,2);
%                  continue
%              end
             
             Box_mean = NaN(10,1);
             RMSBox = NaN(10,1);
             
             for k = 1:10
                 k
                I_Box = matrix(Box_Y(k):Box_Y(k)+Box_Size_Y(k), Box_X(k):Box_X(k)+Box_Size_X(k));
%                 I_Box = matrix_crop(Box_Y(k):Box_Y(k)+Box_Size_Y(k), Box_X(k):Box_X(k)+Box_Size_X(k));
                Box_mean(k) = mean2(I_Box);
                RMSBox(k) = std2(I_Box);
             end
             
             for l = 2:10
                domain_contrast(l) = Box_mean(l) - Box_mean(l-1);
             end
             
             xlswrite('domain_contrast.xlsx',Box_mean(1), 1, ['D' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(2), 1, ['E' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(2), 1, ['F' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(3), 1, ['G' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(3), 1, ['H' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(4), 1, ['I' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(4), 1, ['J' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(5), 1, ['K' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(5), 1, ['L' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(6), 1, ['M' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(6), 1, ['N' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(7), 1, ['O' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(7), 1, ['P' num2str(j+1)]); 
             xlswrite('domain_contrast.xlsx',Box_mean(8), 1, ['Q' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(8), 1, ['R' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(9), 1, ['S' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(9), 1, ['T' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',Box_mean(10), 1, ['U' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',domain_contrast(10), 1, ['V' num2str(j+1)]); 
       
             xlswrite('domain_contrast.xlsx',RMSBox(1), 1, ['W' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(2), 1, ['X' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(3), 1, ['Y' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(4), 1, ['Z' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(5), 1, ['AA' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(6), 1, ['AB' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(7), 1, ['AC' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(8), 1, ['AD' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(9), 1, ['AE' num2str(j+1)]);
             xlswrite('domain_contrast.xlsx',RMSBox(10), 1, ['AF' num2str(j+1)]);
                          
        end
        end 
end
end