function [] = FFT_filtering_2_window(mask_radius,low_frequency_scale, high_frequency_scale)
mkdir('2D FFT maps');
mkdir(['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/low frequency images']);
mkdir(['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/high frequency images']);
i=1;
tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
while ~isempty(tag)  
    if tag
         [~, ~, name]= xlsread('dataInfo.xlsx',['A' num2str(i+1) ':A' num2str(i+1)]);
          load(['data_' num2str(name{1,1}) '.mat']);
          [Y_pixels, X_pixels] = size(matrix); 
          KX0 = (mod(1/2 + (0:(X_pixels-1))/X_pixels , 1) - 1/2);
          KY0 = (mod(1/2 + (0:(Y_pixels-1))/Y_pixels , 1) - 1/2);
         [KX,KY] = meshgrid(KX0,KY0);
          T_1 = (KX.*KX + KY.*KY < (mask_radius/X_pixels)^2);
          FFT = fft2(matrix.*(hamming(X_pixels)*hamming(X_pixels)'), 1024, 1024); 
          FFT = fftshift(log(abs(FFT)+1));
          FFT = mat2gray(FFT);
          save (['2D FFT maps/data_' num2str(name{1,1}) '.mat'], 'FFT'); 
          imwrite(FFT, ['2D FFT maps/' num2str(name{1,1}) '.jpg'], 'jpg'); 
          low = real(ifft2(T_1.*fft2(matrix)));
          high = matrix-low;
          save (['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/low frequency images/data_' num2str(name{1,1}) '.mat'], 'low');
          save (['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/high frequency images/data_' num2str(name{1,1}) '.mat'], 'high');  
          low_rescaled = 0.5 + low/low_frequency_scale; 
          high_rescaled = 0.5 + high/high_frequency_scale; 
          imwrite(high_rescaled, ['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/high frequency images/' num2str(name{1,1}) '.jpg'], 'jpg');
          imwrite(low_rescaled, ['FFT' num2str(mask_radius) '_' num2str(low_frequency_scale)  '_' num2str(high_frequency_scale) '/low frequency images/' num2str(name{1,1}) '.jpg'], 'jpg');
    end
     i = i+1;
     tag = xlsread('dataInfo.xlsx',1, ['B' num2str(i+1)]);
end
end
