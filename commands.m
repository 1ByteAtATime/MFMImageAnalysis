peakfit(h,0,0,2,16,0,100,0,0,[-0.02 0.1]);
planefit_batch_grey(0, 0,0, 0,0, 4,3, 3, 0.1);
crop_image_new();
add_label_new(1, 0, 0, 0, 1, 'T',  30, 'blue', 'white',0.5);
 matrix_rescaled = (0.5 + matrix/scale)*256; 
imwrite(matrix_rescaled, colormap_1, '3.jpg', 'jpg');
FFT_filtering_2_new(mask_radius,low_frequency_scale, high_frequency_scale);
histogram(nbins, peaknum, peakshape);