%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994

clear all
close all
clc

%% Read image and set it to B/W
Img2=imread("highway2.jpg");
Img2=rgb2gray(Img2);

%% Data
peaksNumber=5; 
NHoodSize=21;
threshold=45;

%% Find hough lines
lines2=detectStraightLines(Img2, peaksNumber, NHoodSize);

%% Plot
figure, imshow(Img2), title('Results on Highway2'), hold on
for k = 1:length(lines2)
   xy = [lines2(k).point1; lines2(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

%figure,imshow(Img2)