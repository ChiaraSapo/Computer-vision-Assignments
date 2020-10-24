%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
clear all
close all
clc

%% Read image 1
Img = imread('i235.png','png');

%% Data 
stdDev=20;
SPDensity=0.2;
kSize1=3;
kSize2=7;
sigma=5;
pixels=101;

%% Plot original image
figure, imshow(Img), title('Original picture')
figure, imhist(uint8(Img), 256), title('Original image histogram'), xlabel('Gray scale'), ylabel('Number of pixels')

Img=double(Img); % set image to double



%%%%%%%%%%%%%%%%%%% Gaussian noise filtering %%%%%%%%%%%%%%%%%%%
%% Gaussian noise 
[noisyImg,hist]=gaussianNoise(Img,stdDev);

% Plot image and histogram
figure, imagesc(noisyImg), colormap gray, title('Gaussian noise')
figure,imhist(uint8(noisyImg),256),title('Gaussian noise image histogram'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,histogram(hist),title('Gaussian noise')


%% Moving average filter, K=3
[AverageImg1,ha1] = movingAverageFilter(noisyImg,kSize1);

% Plot image and histogram
figure,imagesc(AverageImg1),colormap gray,title('Moving average filter, K1')
figure,imhist(uint8(AverageImg1),256),title('Moving average filter histogram, K1'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(ha1),title('Moving average filter surface, K1')
figure,imagesc(ha1),title('Moving average filter image, K1')

%% Moving average filter, K=7
[AverageImg2,ha2] = movingAverageFilter(noisyImg,kSize2);

% Plot image and histogram
figure,imagesc(AverageImg2),colormap gray,title('Moving average filter, K2 ')
figure,imhist(uint8(AverageImg2),256),title('Moving average filter histogram, K2'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(ha2),title('Moving average filter surface, K2')
figure,imagesc(ha2),title('Moving average filter image, K2')

%% Gaussian filter, K=3
[gaussImg1,hg1]=gaussFilter(noisyImg, kSize1);

% Plot image and histogram
figure,imagesc(gaussImg1),colormap gray,title('Gaussian filter, sigma1')
figure,imhist(uint8(gaussImg1),256),title('Gaussian filter histogram, sigma1'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(hg1),title('Gaussian filter surface, sigma1')
figure,imagesc(hg1),title('Gaussian filter image, sigma1')

%% Gaussian filter, K=7
[gaussImg2,hg2]=gaussFilter(noisyImg, kSize2);

% Plot image and histogram
figure,imagesc(gaussImg2),colormap gray,title('Gaussian filter, sigma1')
figure,imhist(uint8(gaussImg2),256),title('Gaussian filter histogram, sigma2'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(hg2),title('Gaussian filter surface, sigma2')
figure,imagesc(hg2),title('Gaussian filter image, sigma2')


%% Median filter, K=3
nonLinImg1=medFilter(noisyImg, kSize1);

% Plot image and histogram
figure,imagesc(nonLinImg1),colormap gray,title('Median filter, K1')
figure,imhist(uint8(nonLinImg1),256),title('Median filter histogram, K1'),xlabel('Gray scale'), ylabel('Number of pixels')

%% Median filter, K=7
nonLinImg2=medFilter(noisyImg, kSize2);

% Plot image and histogram
figure,imagesc(nonLinImg2),colormap gray,title('Median filter, K2')
figure,imhist(uint8(nonLinImg2),256),title('Median filter histogram, K2'),xlabel('Gray scale'), ylabel('Number of pixels')


%% Linear filters, K=7
[transfImg1, K1, transfImg2, K2, transfImg3, transfTemp3ver2, K3] = linearFilters(noisyImg,kSize2);
figure,imagesc(transfImg1),colormap gray,title('Impulse filter')
figure,surf(K1),title('Filter 1')

figure,imagesc(transfImg2),colormap gray,title('Shifted impulse filter')
figure,surf(K2),title('Filter 2')
    
figure,imagesc(transfImg3),colormap gray,title('Sharpening filter from slide 45')
figure,imagesc(transfTemp3ver2),colormap gray,title('Sharpening filter from slide 44')
figure,surf(K3),title('Filter 3')



%%%%%%%%%%%%%%%%%%% Salt and pepper noise filtering %%%%%%%%%%%%%%%%%%%
%% Add salt and pepper noise
[noisyImg]=SPNoise(Img,SPDensity);
figure,imagesc(noisyImg), colormap gray, title('Salt and pepper noise')
figure, imhist(noisyImg, 256), title('SP image histogram'), xlabel('Gray scale'), ylabel('Number of pixels')

%% Moving average filter, K=3
[AverageImg1,ha1] = movingAverageFilter(noisyImg,kSize1);

% Plot image and histogram
figure,imagesc(AverageImg1),colormap gray,title('Moving average filter, K1')
figure,imhist(uint8(AverageImg1),256),title('Moving average filter histogram, K1'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(ha1),title('Moving average filter surface, K1')
figure,imagesc(ha1),title('Moving average filter image, K1')

%% Moving average filter, K=7
[AverageImg2,ha2] = movingAverageFilter(noisyImg,kSize2);

% Plot image and histogram
figure,imagesc(AverageImg2),colormap gray,title('Moving average filter, K2 ')
figure,imhist(uint8(AverageImg2),256),title('Moving average filter histogram, K2'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(ha2),title('Moving average filter surface, K2')
figure,imagesc(ha2),title('Moving average filter image, K2')

%% Gaussian filter, K=3
[gaussImg1,hg1]=gaussFilter(noisyImg, kSize1);

% Plot image and histogram
figure,imagesc(gaussImg1),colormap gray,title('Gaussian filter, sigma1')
figure,imhist(uint8(gaussImg1),256),title('Gaussian filter histogram, sigma1'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(hg1),title('Gaussian filter surface, sigma1')
figure,imagesc(hg1),title('Gaussian filter image, sigma1')

%% Gaussian filter, K=7
[gaussImg2,hg2]=gaussFilter(noisyImg, kSize2);

% Plot image and histogram
figure,imagesc(gaussImg2),colormap gray,title('Gaussian filter, sigma1')
figure,imhist(uint8(gaussImg2),256),title('Gaussian filter histogram, sigma2'),xlabel('Gray scale'), ylabel('Number of pixels')
figure,surf(hg2),title('Gaussian filter surface, sigma2')
figure,imagesc(hg2),title('Gaussian filter image, sigma2')


%% Median filter, K=3
nonLinImg1=medFilter(noisyImg, kSize1);

% Plot image and histogram
figure,imagesc(nonLinImg1),colormap gray,title('Median filter, K1')
figure,imhist(uint8(nonLinImg1),256),title('Median filter histogram, K1'),xlabel('Gray scale'), ylabel('Number of pixels')

%% Median filter, K=7
nonLinImg2=medFilter(noisyImg, kSize2);

% Plot image and histogram
figure,imagesc(nonLinImg2),colormap gray,title('Median filter, K2')
figure,imhist(uint8(nonLinImg2),256),title('Median filter histogram, K2'),xlabel('Gray scale'), ylabel('Number of pixels')


%% Linear filters, K=7
[transfImg1, K1, transfImg2, K2, transfImg3, transfTemp3ver2, K3] = linearFilters(noisyImg,kSize2);
figure,imagesc(transfImg1),colormap gray,title('Impulse filter')
figure,surf(K1),title('Filter 1')

figure,imagesc(transfImg2),colormap gray,title('Shifted impulse filter')
figure,surf(K2),title('Filter 2')
    
figure,imagesc(transfImg3),colormap gray,title('Sharpening filter from slide 45')
figure,imagesc(transfTemp3ver2),colormap gray,title('Sharpening filter from slide 44')
figure,surf(K3),title('Filter 3')



%%%%%%%%%%%%%%%%%%% FFT transformation %%%%%%%%%%%%%%%%%%%
%% FFT magnitude

IMG=fft2(Img);         %fft of image
MOD=abs(IMG);           %module
PHI=angle(IMG);         %phase

figure,imagesc(log(fftshift(MOD))), colormap gray,xlabel('wx'),ylabel('wy'),axis square %ffshift porta la freq 0 al centro

%% Magnitude of Gaussian low-pass filter

% Create gaussian filter and transform it in frequency space
FG = fspecial('gaussian', pixels, sigma);
FFG = fftshift(fft2(FG));

% Plot fft image 
figure,imagesc(abs(FFG)),colormap gray,title(['Gauss FFT with ', num2str(pixels),'x', num2str(pixels), ' pixels and sigma=', num2str(sigma)])
figure,mesh(abs(FFG)),title(['Gauss FFT with ', num2str(pixels),'x', num2str(pixels), ' pixels and sigma=', num2str(sigma)])

%% Magnitude of sharpening filter

% Create sharpening filter and transform it in frequency space
tempImg=zeros(pixels);
[transfImg1, K1, transfImg2, K2, transfImg3ver1, transfImg3ver2, K3]  = linearFilters(tempImg,kSize2);
c=zeros(101);
c((47:53),(47:53))=K3;
FFS = fftshift(fft2(c));

% Plot fft image 
figure,imagesc(abs(FFS)),colormap gray,title(['Sharpening FFT with', num2str(pixels),'x', num2str(pixels), ' pixels and spacial support=', num2str(sigma)])
figure,mesh(abs(FFS)),title(['Sharpening FFT with ', num2str(pixels),'x', num2str(pixels), ' pixels and spacial support=', num2str(sigma)])

