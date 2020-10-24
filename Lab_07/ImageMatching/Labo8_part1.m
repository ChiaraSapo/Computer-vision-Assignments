clc, clear all, close all;

%load the images pair
img1 = rgb2gray(imread('images/Monster.jpg'));
img2 = rgb2gray(imread('images/Ex01_01.jpg'));


% if the images are too large you might want to resize them to a smaller
% size
%img1 = imresize(img1, 0.5);
%img2 = imresize(img2, 0.5);

threshold=0.1;
sigmaSIFT=1;
sigmaNCC=1;

for i=1:5
    threshold=threshold+0.1;
    sigmaNCC=sigmaNCC+0.5;
    sigmaSIFT=sigmaSIFT+0.5;
    
    list_ncc = findMatches(img1, img2, 'NCC', threshold, sigmaNCC, sigmaSIFT);
    list_sift = findMatches(img1, img2, 'SIFT', threshold, sigmaNCC, sigmaSIFT);

    figure, show_matches(img1, img2, list_ncc, 0, 1, 'NCC');
    figure, show_matches(img1, img2, list_sift, 1, 2, 'SIFT');
    
end

%% Trying with another image

% % load the images pair
% img1 = rgb2gray(imread('images/Ex02_01.jpg'));
% img2 = rgb2gray(imread('images/Ex02_02.jpg'));
% 
% threshold=0.1;
% sigmaSIFT=1;
% sigmaNCC=1;
% 
% for i=1:5
%     threshold=threshold+0.1;
%     sigmaNCC=sigmaNCC+0.5;
%     sigmaSIFT=sigmaSIFT+0.5;
%     
%     list_ncc = findMatches(img1, img2, 'NCC', threshold, sigmaNCC, sigmaSIFT);
%     list_sift = findMatches(img1, img2, 'SIFT', threshold, sigmaNCC, sigmaSIFT);
% 
%     figure, show_matches(img1, img2, list_ncc, 0, 1, 'NCC');
%     figure, show_matches(img1, img2, list_sift, 1, 2, 'SIFT');
%     
% end

