function [cm] = gift();
cm = zeros(256,3);
for i = 1:256;
    cm(i,1)= i/256;
    cm(i,2)= i/256;
    cm(i,3)= i/256;
end
figure(1)
rgbplot(cm)
figure(2)
colormap(cm)
imagesc((cm(:,1)+cm(:,2)+cm(:,3))/3)
end

