%% Read image
Img = imread('boccadasse.jpg');
load('data.mat')

% rgb2gray converts the truecolor image RGB to the grayscale image I. In
% fact, it's not possible to use colormap on a RGB image
ImgGray=rgb2gray(Img);
figure, imshow(ImgGray), title('Original Boccadasse'), colormap gray

% Parameters used for modifications
shiftX = 30; % shift columns
shiftY = 30; % shift rows
theta = 0; % rotation angle

%% Translation

translatedImg = transformation(Img, shiftX, shiftY, 0);
translatedImg=rgb2gray(translatedImg);

figure, imshow(translatedImg), title('Translated Boccadasse'), colormap gray

%% Rotation

% For cycle to try different angles
for i=1:3 
    theta=theta+30;
    rotatedImg = transformation(Img, 0, 0, theta);
    rotatedImg=rgb2gray(rotatedImg);

    figure, imshow(rotatedImg), title('Rotated Boccadasse'), colormap gray 
end

%% Warping

warpedImg = warping(Img,XD,YD);
warpedImg=rgb2gray(warpedImg);

figure, imshow(warpedImg), title('Warped Boccadasse'), colormap gray

