A=[];
for i=1:254
    for j =1:255
        if low(i,j)>0.0075
            A(i,j)=1;
        else A(i,j)=0;
        end
    end
end
B=[];
for i=1:254
    for j =1:255
        if low(i,j)>0.0075
            B(i,j)=1;
        else B(i,j)=0;
        end
    end
end
C=B-A;
for i=1:254
    for j =1:255
        if C(i,j)<0
            C(i,j)=0;
        else C(i,j)=1;
        end
    end
end
mmatrix_rescaled = (0.2 - low/0.05)*256;
mask=matrix_rescaled.*C+2;
imwrite(mask,colormap_3, '45_color_1.jpg', 'jpg');