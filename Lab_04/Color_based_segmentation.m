%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994

addpath('Functions');
addpath('Input');

close all
clear all

%% Load and show images 

%% First show the imges in graylevel
figure(1)
 for i = 1:6
   Img = strcat('ur_c_s_03a_01_L_0', num2str(375+i),'.png');               % Function that concatenate text.
   imgRGB=imread(Img);
   img_gray=rgb2gray(imgRGB);                                              %Convert RGB image or colormap to grayscale.
   subplot(2,3,i), imagesc(img_gray),colormap gray     
 end
 
%% Split the images in the RGB end HSV components and show them
 for i = 1:6
    figure(2+i-1)
    img_hsv=rgb2hsv(imgRGB);
    figure,subplot(236)
    subplot(231),imagesc(imgRGB(:,:,1)),colormap gray,title('R component')
    subplot(232),imagesc(imgRGB(:,:,2)),colormap gray,title('G component')
    subplot(233),imagesc(imgRGB(:,:,3)),colormap gray,title('B component')
    subplot(234),imagesc(img_hsv(:,:,1)),colormap gray,title('H component')
    subplot(235),imagesc(img_hsv(:,:,2)),colormap gray,title('S component')
    subplot(236),imagesc(img_hsv(:,:,3)),colormap gray,title('V component')
 end

 
%% Select an area in the image 'ur_c_s_03a_01_L_0376.png'

Img3=imread('ur_c_s_03a_01_L_0376.png'); 
figure(8),[outputImg3_black,med_black,std_black]=Select_area_black(Img3);   
figure(9),[outputImg3_red,med_red,std_red]=Select_area_red(Img3);


%% Segment the dark car in the 6 images by thresholding the Hue component
for i = 1:6
    figure(10),subplot(2,3,i),[outputImg4_black]=Segment_dark_car(imgRGB,med_black,std_black);
    figure(11),subplot(2,3,i),[outputImg_red]=Segment_red_car_ms(imgRGB,med_red,std_red);
    figure(12),subplot(2,3,i),[outputImg_red2]=Segment_red_car(imgRGB);
end

% 
%% Segmentation and the related centroid and bounding box
for i = 1:6
    figure(13),subplot(2,3,i),[outputImg5_black]=Segment_with_centroid_black_car(imgRGB);
end
 for i = 1:6
    figure(14),subplot(2,3,i),[outputImg_red]=Segment_with_centroid_red_car(imgRGB);      
 end

