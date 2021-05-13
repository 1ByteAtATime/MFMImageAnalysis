signal=matrix(36,61);
mean=mean2(matrix);
zero=signal+0.3623;
[x_pixels,y_pixels]=size(matrix);
domain=zeros(x_pixels,y_pixels);
mean = mean2(matrix);
for i=1:x_pixels
    for j=1:y_pixels
        if matrix(i,j)>zero
            domain(i,j)=1;
        end
    end
end
imshow(domain);

