function [] = FFT_lineProfile_circle(max_radius)
dirListing = dir ();
for i = 1: length(dirListing)
    if ~dirListing(i).isdir    % check whether the object in the folder is a file
        fileName= dirListing(i).name;
        [~, name, ext] = fileparts(fileName);
        if strcmp('.mat', ext)    % check whether the file is mat file
            for j = 1:max_radius
                load(fileName);            
                [Y_pixels, X_pixels] = size(FFT); 
                 KX0 = (mod(1/2 + (0:(X_pixels-1))/X_pixels , 1) - 1/2);
                 KY0 = (mod(1/2 + (0:(Y_pixels-1))/Y_pixels , 1) - 1/2);
                 [KX,KY] = meshgrid(KX0,KY0);
                 T = ( (KX.*KX + KY.*KY > ((j-1)/X_pixels)^2) & (KX.*KX + KY.*KY <= (j/X_pixels)^2) );
                 T = fftshift(T);
                 matrix = T.*FFT;
                 matrix_1 = reshape(matrix, [Y_pixels * X_pixels,1]);
                s = sum(matrix_1);
                n = nnz(matrix);
                mean = s/n;
                N = name(end-2:end);
                M(j,:) = [j mean];
                b=array2table(M, 'VariableNames', {'Radius', ['Scan' N]});
                writetable(b, [name '.txt'], 'delimiter',' ');
            end
        end
    end
end