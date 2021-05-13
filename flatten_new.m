function [matrix] = flatten_new(data, header, order)
X = [1:header.scan_pixels(1,1)];
Y = data(1:1 , 1:header.scan_pixels(1,1));
f = fit(transpose(X),transpose(Y),['poly' num2str(order)]);
matrix =transpose(transpose(Y) - f(transpose(X)));
for i=2:header.scan_pixels(2,1)
 Y = data(i:i , 1:header.scan_pixels(1,1));
f = fit(transpose(X),transpose(Y),['poly' num2str(order)]);
matrix= [matrix; transpose(transpose(Y) - f(transpose(X)))];
end
[Y,X] = meshgrid(1:header.scan_pixels(1,1),1:header.scan_pixels(2,1));
if header.scan_pixels(2,1) ~= header.scan_pixels(1,1)
   if header.scan_pixels(2,1) < header.scan_pixels(1,1)
    [Yq,Xq] = meshgrid(1:header.scan_pixels(1,1),header.scan_pixels(2,1)/header.scan_pixels(1,1):header.scan_pixels(2,1)/header.scan_pixels(1,1):header.scan_pixels(2,1));
   else
        [Yq,Xq] = meshgrid(header.scan_pixels(1,1)/header.scan_pixels(2,1):header.scan_pixels(1,1)/header.scan_pixels(2,1):header.scan_pixels(1,1),1:header.scan_pixels(1,1));
   end
   matrix = interp2(Y,X,matrix,Yq,Xq,'spline');
end
end
