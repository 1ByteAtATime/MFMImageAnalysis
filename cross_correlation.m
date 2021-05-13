function [] = cross_correlation(image1, image2, scale)
mkdir(['CC_' image1 '_' image2])
 load([image1 '.mat']);
 I1 = matrix_3;
 load([image2 '.mat']);
 I2 = matrix_3;
 c = normxcorr2(I1, I2);
 save(['CC_' image1 '_' image2 '/correlation_map.mat'], 'c');  
 c_rescaled = 0.5 + c/scale;  
  imwrite(c_rescaled, ['CC_' image1 '_' image2 '/correlation_map.jpg'], 'jpg'); 
 [min_ypeak, min_xpeak] = find(c==min(c(:)));
 minimum = min(c(:));
 [max_ypeak, max_xpeak] = find(c==max(c(:)));
  maximum = max(c(:));
  save (['CC_' image1 '_' image2 '/correlation_data.mat'], 'min_ypeak', 'min_xpeak', 'minimum', 'max_ypeak', 'max_xpeak', 'maximum');  