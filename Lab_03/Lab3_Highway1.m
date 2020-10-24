%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994

clear all
close all
clc

%% Read image and set it to B/W
Img1=imread("highway1.jpg");
Img1=rgb2gray(Img1);

%% Data
peaksNumber=4; 
NHoodSize=0;
threshold=70;

%% Find hough lines
lines1=detectStraightLines(Img1, peaksNumber, NHoodSize,threshold);

%% Plot
figure, imshow(Img1), title('Results on Highway1'), hold on
for k = 1:length(lines1)
   xy = [lines1(k).point1; lines1(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

%figure,imshow(Img1)