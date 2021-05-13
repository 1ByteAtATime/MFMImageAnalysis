% Test script for colormaps 
maps={'manitou'; 'munising'; 'saginaw'; 'saugatuck'; 'belle'; 'beaver' };

% [X,Y] = meshgrid(-2:0.2:2,-2:0.2:2);
% Z = X.*exp(-X.^2 - Y.^2);
lena = imread( '~/TestImages/lena512color.jpg' );
Z = sum(lena,3);

figure;

for m = 1:6
    subplot(3,2,m)
%     surface(X,Y,Z); view(3);
    imagesc(Z); axis off;
    colormap( maps{m} );
    title( maps{m} ); 
    freezeColors;
end
