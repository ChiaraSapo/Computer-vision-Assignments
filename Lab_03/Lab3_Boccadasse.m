%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994

clear all
close all
clc

%% Read image and set it B/W
Img=imread("Boccadasse.jpg");
Img=rgb2gray(Img);

%% Data
stdDev=[1, 2.2, 3.5];
threshold=[0.3, 0.5, 0.2];

%% Apply the same operations with different values
for i=1:3
    %% Compute laplacian of Gaussian
    [laplacian,kSize]=LaplacianOfGaussian(stdDev(i));
    figure,subplot(2,2,1),imagesc(laplacian),colormap gray, title(['Laplacian with: standard deviation=',num2str(stdDev(i)),'and K size=',num2str(kSize)])
    subplot(2,2,2),surf(laplacian), title(['Surface of laplacian',num2str(stdDev(i)),'and K size=',num2str(kSize)])

    %% Apply laplacian of Gaussian
    convImg=conv2(Img,laplacian,'same');
    subplot(2,2,4),imagesc(convImg),colormap gray, title('Image convolved with laplacian ')
    
    %% Detect zero crossings function
    edges=detectZeroCrossings(convImg,threshold(i));
    figure,subplot(1,2,1),imagesc(edges),colormap gray, title('Computed edge ')

    %% Detect zero crossings Matlab function
    subplot(1,2,2),imagesc(edge(Img,'log')),colormap gray, title('Matlab edge ')

end
