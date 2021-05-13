 images    = cell(1,1);
 i=113;
while i<=1
% [ ~, ~, name] = xlsread('dataInfo.xlsx',1, ['A' num2str(i+16)]);
% images{i} = imread([ 'labelled_' num2str(name{1,1}) '.bmp']);
% images{i} = imread([ sprintf('%03d',i) '.bmp']);
% images{i} = imread(['Graph' sprintf('%02d',i) '.jpg']);
[images{i}, map{i}] = imread(['MagneticTapeXYTest' sprintf('%03d',i) '.jpg']);
i=1+i;
end
 % create the video writer with 1 fps
 writerObj = VideoWriter('XYWalker.avi');
 writerObj.FrameRate = 1;

 % set the seconds per image
%  secsPerImage = [2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
X=zeros(1,1);
secsPerImage=X+1;

 % open the video writer
 open(writerObj);

 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     if ~isempty(map(u))
     FramedImage = ind2rgb(images(u), map(u));
     end
     frame = im2frame(FramedImage);
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end

 % close the writer object
 close(writerObj);