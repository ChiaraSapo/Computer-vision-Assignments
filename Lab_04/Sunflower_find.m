% Code used to find the coordinates of the desired sunflowers

addpath('Functions');
addpath('Input');

close all
clear all


%% Read image
img=imread('sunflowers.png');

%% Data
sigma=1;
n=10;
sigma_incr=1.5;

[row,col,val]=blobDetection(img, sigma, n, sigma_incr);
figure

%% Show image with the sunflowers
imshow(img); hold on;
for i=1:size(row)
    cx1 = col(i);
    cy1 = row(i);
    rad1 = val(i);
    theta = 0:0.1:(2*pi+0.1);
    X = cx1+cos(theta).*rad1;
    Y = cy1+sin(theta).*rad1;
     if rad1>5
        % Plot big sunflower in blue, label its center
        hold on, plot(X', Y', 'Color', 'b');
        plot(cx1,cy1,'x');
        txt=['' num2str(cx1) ',' num2str(cy1)];
        text(cx1,cy1,txt);
        title(['Coordinates of sunflowers']);
     %else
         % Plot little sunflower in red
         %hold on, plot(X', Y', 'Color', 'r');
     end
end

%% Show the two desired sunflowers
figure,imshow(img), hold on, title(['Desired sunflowers'])
rectangle('Position',[145 340 40 45],'EdgeColor','y','LineWidth',3), hold on
rectangle('Position',[420 340 80 80],'EdgeColor','y','LineWidth',3), hold on
