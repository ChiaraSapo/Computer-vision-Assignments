%% Aurora Bertino S4399133
%% Chiara Saporetti S4798994
%% medFilter: applies the median filter to the input image
    % input: Img: original image
    %        kSize: size of the kernel
    % output: transfImg: filtered image

function [transfImg]=medFilter(Img, kSize)
    
    % Applies the median filter to the image
    % J = medfilt2(I,[m n]) performs median filtering, where each output 
    % pixel contains the median value in the m-by-n neighborhood around 
    % the corresponding pixel in the input image.
    transfImg=medfilt2(Img,[kSize,kSize]);
    
end