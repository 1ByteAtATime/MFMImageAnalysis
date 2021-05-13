function [matrix] = planefit_new(data, header, x_order, y_order)
[m,n] = size(data);
[Y,X] = meshgrid(1:n,1:m);
XX = reshape(X, [n*m,1]);
YY = reshape(Y, [n*m,1]);
ZZ =  reshape(data, [n*m,1]);
str = ['poly' num2str(x_order) num2str(y_order) ];
sf = fit([XX, YY],ZZ, str);
image_planefit = ZZ - sf(XX,YY);
matrix =reshape(image_planefit, [m,n]);
if header.scan_pixels(2,1) ~= header.scan_pixels(1,1)
   if header.scan_pixels(2,1) < header.scan_pixels(1,1)
    [Yq,Xq] = meshgrid(1:n,header.scan_pixels(2,1)/header.scan_pixels(1,1):header.scan_pixels(2,1)/header.scan_pixels(1,1):m);
   else
        [Yq,Xq] = meshgrid(header.scan_pixels(1,1)/header.scan_pixels(2,1):header.scan_pixels(1,1)/header.scan_pixels(2,1):n,1:m);
   end
   matrix = interp2(Y,X,matrix,Yq,Xq,'spline');
end
end
