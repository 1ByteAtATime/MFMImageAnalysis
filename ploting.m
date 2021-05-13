figure
subplot(1,2,1);
plot(A,B,'b','LineWidth',2);
hold on
plot(x_18,y_18, 'rh', 'MarkerSize', 20,'MarkerFaceColor','r');
hold off
set(gca,'FontSize',20);
set(gca,'FontSize',20,'Xlim',[-6,6]);
ylabel('R (\Omega)', 'Fontsize', 30, 'Color', 'k');
xlabel('H (T)', 'Fontsize', 30, 'Color', 'k');
title('MR data at 5K')
subplot(1,2,2);
imshow('labelled_(SRO)4_(round 2)052.bmp');
title('MFM image (0.1Hz 5\mum )', 'FontSize',20);