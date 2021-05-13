function [] = FFT_filtering_new(mask_radius_1,mask_radius_2,low_frequency_scale, high_frequency_scale,noise_scale)
mkdir('2D FFT maps');
mkdir(['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/low frequency images']);
mkdir(['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/high frequency images']);
mkdir(['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/noise images']);
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
          load(['data_' name{1,1} '.mat']);
          [Y_pixels, X_pixels] = size(matrix); 
          KX0 = (mod(1/2 + (0:(X_pixels-1))/X_pixels , 1) - 1/2);
          KY0 = (mod(1/2 + (0:(Y_pixels-1))/Y_pixels , 1) - 1/2);
         [KX,KY] = meshgrid(KX0,KY0);
          T_1 = (KX.*KX + KY.*KY < (mask_radius_1/X_pixels)^2);
          FFT = fft2(matrix); 
          FFT = fftshift(log(abs(FFT)+1));
          FFT = mat2gray(FFT);
          save (['2D FFT maps/data_' name{1,1} '.mat'], 'FFT'); 
          imwrite(FFT, ['2D FFT maps/' name{1,1} '.jpg'], 'jpg'); 
          matrix_1 = real(ifft2(T_1.*fft2(matrix)));
          noise = matrix-matrix_1;
          save (['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale)   '/noise images/data_' name{1,1} '.mat'], 'noise');  
          noise_rescaled = 0.5 + noise/noise_scale; 
          imwrite(noise_rescaled, ['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/noise images/' name{1,1} '.jpg'], 'jpg');
          T_2 = (KX.*KX + KY.*KY < (mask_radius_2/X_pixels)^2);  
          matrix_2 = real(ifft2(T_2.*fft2(matrix)));
          save (['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/low frequency images/data_' name{1,1} '.mat'], 'matrix_2');  
          low_rescaled = 0.5 + matrix_2/low_frequency_scale; 
          imwrite(low_rescaled, ['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/low frequency images/' name{1,1} '.jpg'], 'jpg');
           matrix_3 = matrix_1-matrix_2;
           save (['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/high frequency images/data_' name{1,1} '.mat'], 'matrix_3');
            high_rescaled = 0.5 + matrix_3/high_frequency_scale; 
             imwrite(high_rescaled, ['FFT' num2str(mask_radius_1) '_' num2str(mask_radius_2) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '_' num2str(noise_scale) '/high frequency images/' name{1,1} '.jpg'], 'jpg');
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
end
