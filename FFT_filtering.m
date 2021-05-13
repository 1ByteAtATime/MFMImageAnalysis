function [] = FFT_filtering(mask_radius,low_frequency_scale, high_frequency_scale)
mkdir(['FFT' num2str(mask_radius) '/2D FFT maps']);
mkdir(['FFT' num2str(mask_radius) '/low frequency images']);
mkdir(['FFT' num2str(mask_radius) '/high frequency images']);
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
          load(['data_' name{1,1} '.mat']);
          [Y_pixels, X_pixels] = size(matrix); 
          KX0 = (mod(1/2 + (0:(X_pixels-1))/250 , 1) - 1/2);
          KY0 = (mod(1/2 + (0:(Y_pixels-1))/250 , 1) - 1/2);
         [KX,KY] = meshgrid(KX0,KY0);
          T = (KX.*KX + KY.*KY < (mask_radius/250)^2);
          fft = fft2(matrix); 
          fft = fftshift(log(abs(fft)+1));
          fft = mat2gray(fft);
          imwrite(fft, ['FFT' num2str(mask_radius) '/2D FFT maps/' name{1,1} '.jpg'], 'jpg'); 
          A = ifft2(T.*fft2(matrix));
          AA = reshape(A, [X_pixels*Y_pixels,1]);
          A_rescaled = 0.5 + (A-median(AA))/low_frequency_scale; 
          imwrite(A_rescaled, ['FFT' num2str(mask_radius) '/low frequency images/' name{1,1} '.jpg'], 'jpg');
          B = matrix-A;
            BB = reshape(B, [X_pixels*Y_pixels,1]);
             B_rescaled = 0.5 + (B-median(BB))/high_frequency_scale; 
             imwrite(B_rescaled, ['FFT' num2str(mask_radius) '/high frequency images/' name{1,1} '.jpg'], 'jpg');
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
end
