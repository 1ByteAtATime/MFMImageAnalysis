 images    = cell(274,1);
 i=1
while i==33:50
[ ~, ~, name] = xlsread('dataInfo.xlsx',1, ['A' num2str(i+16)]);
images{i} = imread([ 'labelled_MnBi2Te4_Sample1_Part2' sprintf('%03d',i) '.bmp']);
i=1+i;
end
 % create the video writer with 1 fps
 writerObj = VideoWriter('40K.avi');
 writerObj.FrameRate = 1;

 % set the seconds per image
%  secsPerImage = [2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
X=zeros(1,274);
secsPerImage=X+1;

 % open the video writer
 open(writerObj);

 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u});

     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end

 % close the writer object
 close(writerObj);